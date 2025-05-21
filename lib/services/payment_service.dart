import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentService {
  static const String secretKey = 'YOUR_PAYSTACK_SECRET_KEY';
  static const String publicKey = 'YOUR_PAYSTACK_PUBLIC_KEY';
  static const String baseUrl = 'https://api.paystack.co';

  static Future<Map<String, dynamic>> initializePayment({
    required String email,
    required int amount,
    required String reference,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/transaction/initialize'),
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'amount': amount * 100, // Convert to kobo
        'reference': reference,
        'callback_url': 'https://your-callback-url.com',
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to initialize payment: ${response.body}');
    }
  }

  static Future<bool> verifyPayment(String reference) async {
    final response = await http.get(
      Uri.parse('$baseUrl/transaction/verify/$reference'),
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['status'] == 'success';
    }
    return false;
  }

  static Future<void> savePaymentStatus(bool isPaid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_paid', isPaid);
  }

  static Future<bool> getPaymentStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_paid') ?? false;
  }
} 