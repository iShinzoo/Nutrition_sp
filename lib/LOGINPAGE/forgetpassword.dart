import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nutritionix/LOGINPAGE/resetpassword.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  final emailText = TextEditingController(); // Define emailText controller outside build
  final formKey = GlobalKey<FormState>(); // Define formKey outside build

  // Function to handle forget password logic
  void forgetPassword(BuildContext context) async {
    var regBody = {
      "email": emailText.text,
    };

    try {
      // Call forgotPassword API
      var response = await http.post(
        Uri.parse('${dotenv.env['BACKEND_URL'] ?? ''}/forgetpassword'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Reset link sent to your email!")),
        );

        // Extract reset link and token for navigation
        final resetLink = jsonDecode(response.body)['reset_link'];
        final token = Uri.parse(resetLink).queryParameters['token'];

        if (token != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ResetPasswordPage(token: token),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid reset link format.")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send reset email.")),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 350,
            width: 350,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "FORGOT PASSWORD",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter your email ID to reset your password.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    letterSpacing: 0.7,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: emailText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email ID",
                      hintStyle: const TextStyle(
                        letterSpacing: 1.5,
                        color: Colors.black54,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        forgetPassword(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
