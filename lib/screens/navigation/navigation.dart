import 'package:flutter/material.dart';
import 'package:out_of_bounds/widgets/app_bar/app_bar_right_widget.dart';
import 'package:out_of_bounds/widgets/generic_check_list.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  List<BottomNavigationBarItem> get _bottomNavigationBarItems => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: "Progress",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner),
          label: "Materials",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Account Settings",
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
              title: "Technologies",
              // buttonText: "Cancel",
              onButtonPressed: () {},
            ),
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
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _bottomNavigationBarItems,
      ),
    );
  }
}