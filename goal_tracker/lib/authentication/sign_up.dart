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
                // mainAxisAlignment: MainAxisAlignment.center,
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
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.deepPurpleAccent,
        //     blurRadius: 5.0,
        //     spreadRadius: 1.0,
        //     blurStyle: BlurStyle.outer
        //   ),
        // ],
        // backgroundBlendMode: BlendMode.color
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
                      // foreground: Paint()
                      //   ..shader = ui.Gradient.linear(
                      //     const Offset(0, 20),
                      //     const Offset(150, 20),
                      //     const <Color>[
                      //       Color(0xFFDDD5D0),
                      //       Color(0xFF8D44D4),
                      //     ],
                      //   ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: TextFormField(
                    controller: _usernameController,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      iconColor: Colors.white,
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    keyboardType: TextInputType.text, 
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      iconColor: Colors.white,
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress, 
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: TextFormField(
                    controller: _dobController,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.date_range),
                      iconColor: Colors.white,
                      hintText: "Enter Your Date Of Birth",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    keyboardType: TextInputType.datetime, 
                  ),
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: TextFormField(
                          controller: _passwordController,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            iconColor: Colors.white,
                            hintText: "Enter Your Password",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) return 'Empty';
                            if (value != _passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                          controller: _confirmPasswordController,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            iconColor: Colors.white,
                            hintText: "Confirm Your Password",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                    ],
                  )
                ),
                SignUpButton(onPressed: () {
                  _form.currentState!.validate();
                },),
              ],
            ),
          ),
        ),
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