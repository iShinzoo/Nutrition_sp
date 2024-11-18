import 'package:flutter/material.dart';
import 'package:nutritionix/DASHBOARD/bottomnavigation%20bar1.dart';
import 'package:nutritionix/LOGINPAGE/forgetpassword.dart';
import 'package:nutritionix/SIGNUPPAGE/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Loginpage> {
  final emailText = TextEditingController();
  final passText = TextEditingController();
  bool isVisible = false;

  final formKey = GlobalKey<FormState>();

  // Check if user is already logged in by checking for the JWT token
  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  // Check if JWT token exists in SharedPreferences
  checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');
    if (token != null) {
      // If token exists, navigate to the dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
      );
    }
  }

  // Function to handle login
  void loginUser(BuildContext context) async {
    var regBody = {
      "email": emailText.text,
      "password": passText.text,
    };

    try {
      // Call login API with email and password
      var response = await http.post(
        Uri.parse('${dotenv.env['BACKEND_URL'] ?? ''}/login'), // Replace with actual URL
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailText.text,
          "password": passText.text,
        }),
      );

      if (response.statusCode == 200) {
        // Store JWT token in SharedPreferences
        var data = jsonDecode(response.body);
        String token = data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt_token', token);

        // Navigate to the dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to login.")),
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
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: emailText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User name is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          letterSpacing: 1.5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.deepOrange,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                          ),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: passText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          letterSpacing: 1.5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.deepOrange,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                              isVisible ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          letterSpacing: 1.2,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 300,
                    color: Colors.blueAccent.shade200,
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginUser(context);
                        }
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have Account?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signuppage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
