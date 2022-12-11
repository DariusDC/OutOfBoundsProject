import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/screens/login/login_screen.dart';
import 'package:out_of_bounds/screens/settings/settings_view_model.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/app_bar/hello_app_bar.dart';
import 'package:out_of_bounds/widgets/app_divider.dart';
import 'package:out_of_bounds/widgets/settings_list_item.dart';
import 'package:rxdart/rxdart.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseRequestScreen<SettingsScreen> {
  late SettingsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SettingsViewModel(
      Input(
        PublishSubject(),
      ),
    );

    _bindUI();
  }

  _bindUI() {
    disposeLater(
      _viewModel.output.onSettingAction.listen(
        (option) {
          switch (option) {
            case SettingsListOption.LOGOUT:
              _onLogout();
          }
        },
      ),
    );
  }

  _onLogout() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HelloAppBar(user: User(firstName: "Marius", lastName: "Popa")),
              const SizedBox(height: AppDimens.largePadding),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Settings", style: AppTextStyles.x4LBoldPoppins),
              ),
              const SizedBox(height: AppDimens.largePadding),
              const AppDivider(),
              ...SettingsListOption.values
                  .map((e) => Column(
                        children: [
                          SettingsListItem(
                            title: getTitle(e),
                            icon: getIcon(e),
                            onTap: () => _viewModel.input.settingAction.add(e),
                          ),
                          const AppDivider(),
                        ],
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  String getTitle(SettingsListOption option) {
    switch (option) {
      case SettingsListOption.LOGOUT:
        return "Logout";
    }
  }

  IconData getIcon(SettingsListOption option) {
    switch (option) {
      case SettingsListOption.LOGOUT:
        return Icons.exit_to_app;
    }
  }
}
