import 'package:flutter/material.dart';

class PaystackPayMentPage extends StatefulWidget {
  const PaystackPayMentPage({super.key});

  @override
  State<PaystackPayMentPage> createState() => _PaystackPayMentPageState();
}

class _PaystackPayMentPageState extends State<PaystackPayMentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: const Center(
        child: Text('Payment Page - Coming Soon'),
      ),
    );
  }
} 