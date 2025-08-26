import 'dart:developer' as console;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF53D8FB),
              Color(0xFFB844D4),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/sign_up.svg',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SignUpForm(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Already having an account?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login here',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF0083D4),
                            ),
                          ),
                        ),
                      ],
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

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      console.log(_usernameController.text);
    });
    _emailController.addListener(() {
      console.log(_emailController.text);
    });
    _dobController.addListener(() {
      console.log(_dobController.text);
    });
    _passwordController.addListener(() {
      console.log(_passwordController.text);
    });
    _confirmPasswordController.addListener(() {
      console.log(_confirmPasswordController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: Colors.black26,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Color(0x20000000),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                FormTextField(
                  controller: _usernameController,
                  icon: Icon(Icons.person),
                  hintText: "Enter your Name",
                  type: TextInputType.text,
                  obscureText: false,
                  validator: null,
                ),
                FormTextField(
                  controller: _emailController,
                  icon: Icon(Icons.email),
                  hintText: "Enter your Email",
                  type: TextInputType.emailAddress,
                  obscureText: false,
                  validator: null,
                ),
                FormTextField(
                  controller: _dobController,
                  icon: Icon(Icons.date_range),
                  hintText: "DD/MM/YYYY",
                  type: TextInputType.datetime,
                  obscureText: false,
                  validator: null,
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      FormTextField(
                        controller: _passwordController,
                        icon: Icon(Icons.password),
                        hintText: "Enter your Password",
                        type: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: null,
                      ),
                      FormTextField(
                        controller: _confirmPasswordController,
                        icon: Icon(Icons.password),
                        hintText: "Confirm Your Password",
                        type: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) return 'Empty';
                          if (value != _passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      )
                    ],
                  )
                ),
                SignUpButton(onPressed: () {
                  _form.currentState!.validate();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.type,
    required this.obscureText,
    required this.validator,
  });

  final TextEditingController controller;
  final Icon icon;
  final String hintText;
  final TextInputType type;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          icon: widget.icon,
          iconColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        keyboardType: widget.type,
        obscureText: widget.obscureText,
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12)
            ),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
            Colors.white,
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            Color(0xFF8D44D4),
          ),
        ),
        child: Center(
          child: Text(
            'SIGN UP',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        )
      ),
    );
  }
}