import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  var email;

  HomeScreen(this.email);

  @override
  _HomeScreenState createState() => _HomeScreenState(email);
}

class _HomeScreenState extends State<HomeScreen> {
  var email;

  _HomeScreenState(this.email);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Bạn đã login thành công vào acc ${email}"),
    );
  }
}
