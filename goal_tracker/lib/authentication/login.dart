import 'dart:developer' as console;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                      'assets/login.svg',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  LoginForm(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Not having an account?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SignUp(),
                            //   ),
                            // );
                          },
                          child: Text(
                            'Register here',
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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordVisibility;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      console.log(_emailController.text);
    });
    _passwordController.addListener(() {
      console.log(_passwordController.text);
    });
    _passwordVisibility = false;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                    'Login',
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisibility = !_passwordVisibility;
                          });
                        },
                        icon: Icon(
                          _passwordVisibility
                          ? Icons.visibility
                          : Icons.visibility_off,
                        ),
                      ),
                      suffixIconColor: Colors.white,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisibility,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF0083D4),
                          // shadows: [
                          //   Shadow(
                          //     color: Colors.black12,
                          //     offset: Offset.fromDirection(2),
                          //     blurRadius: 2.0
                          //   ),
                          // ]
                        ),
                      ),
                    ),
                  ],
                ),
                LoginButton(onPressed: () {},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
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
            'SIGN IN',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        )
      ),
    );
  }
}