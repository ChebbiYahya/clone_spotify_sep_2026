import 'package:clone_spotify_sep_2026/screens/login/signin_page.dart';
import 'package:clone_spotify_sep_2026/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../home/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController _uernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formkey;
  bool _paswordInvisible = true;
  @override
  void initState() {
    _uernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formkey = GlobalKey<FormState>();
    print("hello in sign page");
    super.initState();
  }

  @override
  void dispose() {
    _uernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    print("bye bye  sign page");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset("assets/images/logo-spotify.svg", height: 30),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset("assets/images/logo-spotify.svg"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome! Register to get started",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Enter your username",
                      prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                    ]).call,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Enter your email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(
                        errorText: "Please enter a valid email addres",
                      ),
                    ]).call,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _paswordInvisible,
                    decoration: InputDecoration(
                      labelText: "Enter your password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _paswordInvisible = !_paswordInvisible;
                          });
                        },
                        icon: Icon(
                          _paswordInvisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(
                        6,
                        errorText: "Password must be at least 6 characters",
                      ),
                      MaxLengthValidator(
                        15,
                        errorText: "Password must not exceed 15 characters",
                      ),
                    ]).call,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print("jawna behy");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        print("jawna mouch behy");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 1),
                    ),
                    child: Text("Sign up"),
                  ),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SigninPage()),
                        );
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(text: "Already have an account "),
                            TextSpan(
                              text: "Login! ",
                              style: TextStyle(color: TColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
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
