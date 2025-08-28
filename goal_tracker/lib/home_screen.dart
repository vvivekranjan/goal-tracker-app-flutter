import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53D8FB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Goals \n for Today',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 20),
                        const Offset(150, 20),
                        <Color>[
                          Colors.white,
                          Color(0xFFB844D4),
                        ],
                      ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 40,
                        color: Color(0xFFB844D4),
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Color(0xFFB844D4),
                        ),
                      )
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(32.0),
                topEnd: Radius.circular(32.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                GoalsItem(),
                GoalsItem(),
                GoalsItem(),
                GoalsItem(),
                GoalsItem(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GoalsItem extends StatefulWidget {
  const GoalsItem({super.key});

  @override
  State<GoalsItem> createState() => _GoalsItemState();
}

class _GoalsItemState extends State<GoalsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 24,
                  child: Image(
                    image: NetworkImage('https://imgs.search.brave.com/7dIiMaOzRgMklOGenMlwOOfh1Nj8ELWlUAU7L0uJFBQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzNkL2Jk/LzAwLzNkYmQwMDgx/MjllMWNiMmI0MjQy/NmNlMGYyZGJjOWMw/LmpwZw'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Drink Water',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  value: 0.52,
                  color: Color(0xFFB844D4),
                  backgroundColor: Color(0x66B844D4),
                  strokeWidth: 7,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}