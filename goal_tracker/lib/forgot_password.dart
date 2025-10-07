import 'dart:developer' as console;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text('Forgot Password', style: TextStyle(fontSize: 28)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF53D8FB), Color(0xFFB844D4)],
          ),
        ),
        child: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    'assets/forgot_password.svg',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                ForgotForm()
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      console.log(_emailController.text);
    });
    _dobController.addListener(() {
      console.log(_dobController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _dobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.black26, width: 1),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormTextField(
                  controller: _emailController,
                  icon: const Icon(Icons.email),
                  hintText: "Enter your Email",
                  type: TextInputType.emailAddress,
                ),
                FormTextField(
                  controller: _dobController,
                  icon: const Icon(Icons.date_range),
                  hintText: "DD/MM/YYYY",
                  type: TextInputType.datetime,
                ),
                ForgotButton(onPressed: () {}),
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
  });

  final TextEditingController controller;
  final Icon icon;
  final String hintText;
  final TextInputType type;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          icon: widget.icon,
          iconColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 20, color: Colors.white),
        ),
        keyboardType: widget.type,
      ),
    );
  }
}

class ForgotButton extends StatelessWidget {
  const ForgotButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF8D44D4)),
        ),
        child: Center(child: Text('CHECK', style: TextStyle(fontSize: 24))),
      ),
    );
  }
}
