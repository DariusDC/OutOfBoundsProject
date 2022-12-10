import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/technology.dart';
import 'package:out_of_bounds/screens/technologies/technologies_screen.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/screens/progress/progress_screen.dart';
import 'package:out_of_bounds/widgets/app_bar/app_bar_right_widget.dart';
import 'package:out_of_bounds/widgets/generic_check_list.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  @override
  void initState() {
    super.initState();
  }

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

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen,
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

  Widget get _getScreen {
    if (_selectedIndex == 0) {
      return ProgressScreen();
    } else if (_selectedIndex == 1) {
      return Center(
        child: Text("Materials"),
      );
    }
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TechnologiesScreen();
          }));
        },
        child: Text("Selecte Technologies"),
      ),
    );
  }
}
