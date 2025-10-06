import 'package:flutter/material.dart';
import 'package:goal_tracker/change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text('Profile', style: TextStyle(fontSize: 48)),
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileOptions(title: 'Edit Profile', onPressed: () {},),
                ProfileOptions(
                  title: 'Change Password',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ValidatePassword())
                    );
                  },
                ),
                ProfileOptions(title: 'Delete Account', onPressed: () {},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
    required this.title,
    required this.onPressed,
    });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            InkWell(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: const Icon(
                  Icons.arrow_circle_right,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Divider(color: Colors.white),
      ],
    );
  }
}
