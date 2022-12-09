import 'package:flutter/material.dart';
import 'package:out_of_bounds/widgets/app_bar/app_bar_right_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBarRightWidget(
          title: "Home",
          onButtonPressed: () {},
        ),
      ],
    ));
  }
}
