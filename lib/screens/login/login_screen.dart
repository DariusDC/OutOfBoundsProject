import 'package:flutter/material.dart';
import 'package:out_of_bounds/extensions/string_extensions.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/buttons/app_text_button.dart';
import 'package:out_of_bounds/widgets/buttons/general_button.dart';
import 'package:out_of_bounds/widgets/inputs/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRequestScreen<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppDimens.x14LPadding,
              left: AppDimens.xLPadding,
              right: AppDimens.xLPadding,
              bottom: AppDimens.largePadding,
            ),
            child: Column(
              children: [
                const Text(
                  "LOGO",
                  style: AppTextStyles.x6LBoldPoppins,
                ),
                TextFieldInput(
                  controller: _emailController,
                  hint: "email".translate(context),
                ),
                const SizedBox(height: AppDimens.largePadding),
                TextFieldInput(
                  controller: _passwordController,
                  hint: "password".translate(context),
                ),
                const SizedBox(height: AppDimens.largePadding),
                GeneralButton(
                    onPressed: () {}, text: "login".translate(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
