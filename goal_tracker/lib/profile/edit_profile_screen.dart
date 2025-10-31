import 'dart:ui';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      extendBodyBehindAppBar: true,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(child: ProfileContainer()),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({super.key});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {

  // final _usernameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _dobController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   // Listeners removed as they were empty
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _usernameController.dispose();
  //   _emailController.dispose();
  //   _dobController.dispose();
  // }

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
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    maxRadius: 48,
                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/6858/6858504.png',),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          FormTextField(
                            hintText: 'Enter your Username',
                            initialValue: 'Vivek',
                            type: TextInputType.text,
                            obscureText: false,
                            readOnly: false,
                            validator: null,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          FormTextField(
                            hintText: 'Enter your Email',
                            initialValue: 'vvivekranjan20@gmail.com',
                            type: TextInputType.emailAddress,
                            obscureText: false,
                            readOnly: true,
                            validator: null,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'DOB',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          FormTextField(
                            hintText: 'Enter your Date Of Birth',
                            initialValue: '16/06/2004',
                            type: TextInputType.datetime,
                            obscureText: false,
                            readOnly: true,
                            validator: null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    required this.hintText,
    required this.initialValue,
    required this.type,
    required this.obscureText,
    required this.readOnly,
    required this.validator,
  });

  final String hintText;
  final String initialValue;
  final TextInputType type;
  final bool obscureText;
  final bool readOnly;
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: widget.initialValue,
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 20, color: Colors.white),
        ),
        keyboardType: widget.type,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        validator: widget.validator,
      ),
    );
  }
}
