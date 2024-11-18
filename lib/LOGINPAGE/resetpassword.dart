import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Importing for jsonEncode

class ResetPasswordPage extends StatelessWidget {
  final String token;
  ResetPasswordPage({required this.token});

  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void resetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        // Disable button during API call
        showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()),
        );

        // Call resetPassword API with token
        var response = await http.post(
          Uri.parse('${dotenv.env['BACKEND_URL'] ?? ''}/resetpassword'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"password": newPasswordController.text}),
        );

        Navigator.pop(context); // Remove the progress indicator

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Password reset successfully!"))
          );
          Navigator.pop(context); // Go back after successful password reset
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to reset password.")),
          );
        }
      } catch (error) {
        Navigator.pop(context); // Remove the progress indicator on error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred: $error")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: newPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "New Password",
                  hintText: "Enter your new password",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => resetPassword(context),
                child: Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
