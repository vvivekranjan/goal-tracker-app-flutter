import 'dart:ui';

import 'package:flutter/material.dart';

class GoalsData {

  GoalsData({
    required this. goalId,
    required this.name,
    required this.endDate,
    required this.progressValue,
    this.icon,
  });

  final int goalId;
  final String name;
  final DateTime endDate;
  final int progressValue;
  final String? icon;
}

List<GoalsData> goalsData = [
  GoalsData(goalId: 001, name: 'Do Yoga', endDate: DateTime(2025), progressValue: 24, icon: 'https://imgs.search.brave.com/Z1UZlRBlAXbY1YD6TGLQkESc8cZ6JuEQBpKw2OmomF4/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20veUFZeTQv/TUFGbHNLeUFZeTQv/MS90bC9jYW52YS15/b2dhLWlsbHVzdHJh/dGlvbi1NQUZsc0t5/QVl5NC5wbmc'),
  GoalsData(goalId: 002, name: 'Do Coding', endDate: DateTime(2025), progressValue: 56, icon: 'https://imgs.search.brave.com/keASzh1tcuIR2Hf8kpmQ7rmSJ8O4lUIQ5L7MwSIALCc/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAyNC8w/NS8yMC8xMy8yOC9h/aS1nZW5lcmF0ZWQt/ODc3NTIzM182NDAu/cG5n'),
  GoalsData(goalId: 003, name: 'Make Project', endDate: DateTime(2025), progressValue: 88),
  GoalsData(goalId: 004, name: 'Learn Gen AI', endDate: DateTime(2025), progressValue: 66, icon: 'https://imgs.search.brave.com/jCHofzoU70xf5Coj1nPjSh11j1XjMfLXFXAPpA6AZnU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAxNS8w/Ny8yNy8xNy8xNC9t/b3VudGFpbnMtODYy/ODcwXzY0MC5qcGc'),
  GoalsData(goalId: 005, name: 'Hit the GYM', endDate: DateTime(2025), progressValue: 13, icon: 'https://imgs.search.brave.com/0mP2t40k8mszAVAYcJ1hNjpSwx5ga6Qd0E0WvHabMXY/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2JmLzFk/LzFmL2JmMWQxZmE3/YTcwYjZmZWQxZTg3/ZGU4YTJjMmVmMDhl/LmpwZw'),
  GoalsData(goalId: 006, name: 'Eat Healthy', endDate: DateTime(2025), progressValue: 80, icon: 'https://imgs.search.brave.com/_VF1hIgTiMG7dEUKusjZhirFcc9I3t24Gs-Ha_L2IpY/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzlmL2I2/L2Y0LzlmYjZmNDQ0/Yjg3NmU0N2M3MDAz/YzUxYjM3MmJiZjQ2/LmpwZw'),
  GoalsData(goalId: 007, name: 'Get Good Sleep', endDate: DateTime(2025), progressValue: 52),
];

const String defaultIcon = 'https://imgs.search.brave.com/qa3D7S-V1de1p9GPk4pmfcCVhAIcntcn2gzOYIP6Cfg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzExLzIwLzQxLzU2/LzM2MF9GXzExMjA0/MTU2NjVfV0hrcXNw/VW90NmJiUlRzTGZV/RnBKcnhuMXFldFVa/VVkuanBn';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Your Goals \n for Today',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
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
                            size: 36,
                            color: Colors.white,
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            maxRadius: 36,
                            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/6858/6858504.png'),
                          )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: Text(
                'My Goals',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(32.0),
                    topEnd: Radius.circular(32.0),
                  ),
                  color: Color(0x20000000),
                ),
                child: ListView.builder(
                  itemCount: goalsData.length,
                  itemBuilder: (context, index) {
                    return GoalsItem(
                      iconImage: NetworkImage(goalsData[index].icon ?? defaultIcon),
                      title: goalsData[index].name,
                      progressValue: goalsData[index].progressValue,
                      endDate: goalsData[index].endDate,
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalsItem extends StatefulWidget {
  const GoalsItem({
    super.key,
    this.iconImage,
    required this.title,
    required this.progressValue,
    required this.endDate,
    });

    final NetworkImage? iconImage;
    final String title;
    final int progressValue;
    final DateTime endDate;

  @override
  State<GoalsItem> createState() => _GoalsItemState();
}

class _GoalsItemState extends State<GoalsItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Card(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 42,
                        backgroundImage: widget.iconImage,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Ends On: ${widget.endDate}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 52,
                            width: 52,
                            child: CircularProgressIndicator(
                              value: widget.progressValue/100,
                              color: Color(0xFFD844D4),
                              backgroundColor: Color(0x66D844D4),
                              strokeWidth: 10,
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                          Center(
                            child: Text(
                              '${widget.progressValue}%',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
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
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}