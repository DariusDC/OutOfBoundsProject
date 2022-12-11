import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/technology.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/screens/navigation/navigation_view_model.dart';
import 'package:out_of_bounds/screens/settings/settings_screen.dart';
import 'package:out_of_bounds/screens/technologies/technologies_screen.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/screens/progress/progress_screen.dart';
import 'package:out_of_bounds/widgets/app_bar/app_bar_right_widget.dart';
import 'package:out_of_bounds/widgets/generic_check_list.dart';
import 'package:rxdart/rxdart.dart';

import '../home/home_screen.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  _AppNavigationScreenState createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends BaseRequestScreen<AppNavigationScreen> {
  late NavigationViewModel _viewModel;
  User? _user;

  @override
  void initState() {
    super.initState();
    _viewModel = NavigationViewModel(
      Input(
        PublishSubject(),
      ),
    );

    disposeLater(_viewModel.output.onUser.listen((newUser) {
      setState(() {
        _user = newUser;
      });
    }));
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItems => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: "Progress",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    if (_user == null) return Container();
    return Scaffold(
      body: _getScreen,
      bottomNavigationBar: _user?.userState == UserState.WORKING
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: _bottomNavigationBarItems,
            )
          : null,
    );
  }

  Widget get _getScreen {
    if (_selectedIndex == 0) {
      return ProgressScreen(user: _user);
    } else if (_selectedIndex == 1) {
      return const HomeScreen();
    }
    return const SettingsScreen();
  }
}
