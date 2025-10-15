import 'package:flutter/material.dart';
import 'package:goal_tracker/validate_password.dart';

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
                ProfileOptions(title: 'Delete Account', onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DeletePopScreen();
                    }
                  );
                }),
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

class DeletePopScreen extends StatefulWidget {
  const DeletePopScreen({super.key});

  @override
  State<DeletePopScreen> createState() => _DeletePopScreenState();
}

class _DeletePopScreenState extends State<DeletePopScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: BoxConstraints.tightForFinite(height: 250),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Are you sure you want to delete your account?',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Type \"DELETE\" in the box'
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.redAccent),
                    ),
                    child: Text(
                      'YES',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context);},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.blueAccent),
                    ),
                    child: Text(
                      'NO',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}