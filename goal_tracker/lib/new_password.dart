import 'dart:math' as console;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text('New Password', style: TextStyle(fontSize: 28)),
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
          child: SingleChildScrollView(
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
                  NewForm()
                ]
              ),
          ),
        ),
      ),
    );
  }
}

class NewForm extends StatefulWidget {
  const NewForm({super.key});

  @override
  State<NewForm> createState() => _NewFormState();
}

class _NewFormState extends State<NewForm> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
    });
    _confirmPasswordController.addListener(() {
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                  NewButton(onPressed: () {}),
                ],
              ),
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
        obscureText: widget.obscureText,
        validator: widget.validator,
      ),
    );
  }
}

class NewButton extends StatelessWidget {
  const NewButton({super.key, required this.onPressed});

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
