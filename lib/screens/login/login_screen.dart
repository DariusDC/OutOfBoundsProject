import 'package:flutter/material.dart';
import 'package:out_of_bounds/widgets/app_bar/app_bar_right_widget.dart';
import 'package:out_of_bounds/widgets/generic_check_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<BottomNavigationBarItem> get _bottomNavigationBarItems => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppBarRightWidget(
              title: "Home",
              buttonText: "Cancel",
              onButtonPressed: () {},
            ),
            Text("Home"),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) {
            //       return Scaffold(
            //         body: Center(
            //           child: GenericCheckList(
            //             items: ["1", "2", "3"],
            //             onSubmit: () {},
            //           ),
            //         ),
            //       );
            //     }));
            //   },
            //   child: Text("Open"),
            // ),
            Flexible(
              child: GenericCheckList(
                items: ["1", "2", "3"],
                onSubmit: (items) {
                  print("$items");
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          print("page:$index");
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _bottomNavigationBarItems,
      ),
    );
  }
}
