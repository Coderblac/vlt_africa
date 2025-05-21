import 'package:flutter/material.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'services/payment_service.dart';
import 'dart:math';

class PaystackPaymentPage extends StatefulWidget {
  final String courseTitle;
  const PaystackPaymentPage({
    super.key,
    required this.courseTitle,
  });

  @override
  State<PaystackPaymentPage> createState() => _PaystackPaymentPageState();
}

class _PaystackPaymentPageState extends State<PaystackPaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  String _generateReference() {
    return 'ref_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }

  Future<void> _processPayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final reference = _generateReference();
      final response = await PaymentService.initializePayment(
        email: _emailController.text,
        amount: 2999, // NGN 2,999
        reference: reference,
      );

      final uniqueTransRef = PayWithPayStack().generateUuidV4();

      PayWithPayStack().now(
        context: context,
        secretKey: PaymentService.secretKey,
        customerEmail: _emailController.text,
        reference: uniqueTransRef,
        currency: "NGN",
        amount: 299900, // Amount in kobo
        callbackUrl: "https://your-callback-url.com",
        transactionCompleted: (paymentData) async {
          final isVerified = await PaymentService.verifyPayment(reference);
          if (isVerified) {
            await PaymentService.savePaymentStatus(true);
            if (mounted) {
              Navigator.pop(context, true);
            }
          } else {
            setState(() {
              _errorMessage = 'Payment verification failed';
            });
          }
        },
        transactionNotCompleted: (reason) {
          setState(() {
            _errorMessage = 'Payment was not successful: $reason';
          });
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: const Color(0xFF2a3935),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subscribe to ${widget.courseTitle}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'NGN 2,999',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _processPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2a3935),
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Pay Now',
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
} 