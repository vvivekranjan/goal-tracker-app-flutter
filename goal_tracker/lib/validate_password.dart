import 'dart:developer' as console;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ValidatePassword extends StatefulWidget {
  const ValidatePassword({super.key});

  @override
  State<ValidatePassword> createState() => _ValidatePasswordState();
}

class _ValidatePasswordState extends State<ValidatePassword> {

  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      console.log(_passwordController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text('Validate Password', style: TextStyle(fontSize: 28)),
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
          minimum: EdgeInsets.all(8.0),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    'assets/validate_password.svg',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                ValidationForm()
              ]
            ),
        ),
      ),
    );
  }
}

class ValidationForm extends StatefulWidget {
  const ValidationForm({super.key});

  @override
  State<ValidationForm> createState() => _ValidationFormState();
}

class _ValidationFormState extends State<ValidationForm> {
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      console.log(_passwordController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
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
                  controller: _passwordController,
                  icon: const Icon(Icons.password),
                  hintText: "Enter your Current Password",
                  type: TextInputType.visiblePassword,
                ),
                ValidateButton(onPressed: () {}),
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

class ValidateButton extends StatelessWidget {
  const ValidateButton({
    super.key,
    required this.onPressed,
  });

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
            'CHECK',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        )
      ),
    );
  }
}