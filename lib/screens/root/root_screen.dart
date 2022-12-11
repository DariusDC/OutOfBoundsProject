import 'package:flutter/material.dart';
import 'package:out_of_bounds/repository/shared_preferences_repository.dart';
import 'package:out_of_bounds/screens/login/login_screen.dart';
import 'package:out_of_bounds/screens/navigation/navigation_screen.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    SharedPreferencesRepository().getCurrentSession().listen((session) {
      setState(() {
        _isLoggedIn = session != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return (_isLoggedIn ?? false)
        ? const AppNavigationScreen()
        : const LoginScreen();
  }
}
