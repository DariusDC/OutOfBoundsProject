import 'package:flutter/material.dart';
import 'package:out_of_bounds/extensions/string_extensions.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/screens/login/login_screen.dart';
import 'package:out_of_bounds/screens/register/register_view_model.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/buttons/app_text_button.dart';
import 'package:out_of_bounds/widgets/buttons/general_button.dart';
import 'package:out_of_bounds/widgets/inputs/text_field_input.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseRequestScreen<RegisterScreen> {
  late RegisterViewModel _viewModel;
  Exception? _loginError;

  @override
  void initState() {
    super.initState();
    _viewModel = RegisterViewModel(
      Input(
        PublishSubject(),
      ),
    );

    fetchData(_viewModel.output.onRegister, handleValue: (registered) {
      setState(() {
        _loginError = null;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            const LoginScreen(comingFrom: LoginComingFrom.REGISTER),
      ));
    }, handleError: (e) {
      if (e is DioError) {
        setState(() {
          _loginError = e;
        });
      }
    });
  }

  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");

  void _onRegisterTap() {
    _viewModel.input.register.add(
      UserRegister(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      ),
    );
  }

  _goToLogin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
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
                        "Register",
                        style: AppTextStyles.x3LBoldPoppins,
                      ),
                      const SizedBox(height: AppDimens.x4LPadding),
                      TextFieldInput(
                        controller: _usernameController,
                        hint: "Username",
                      ),
                      const SizedBox(height: AppDimens.x4LPadding),
                      TextFieldInput(
                        controller: _emailController,
                        hint: "Email",
                      ),
                      const SizedBox(height: AppDimens.largePadding),
                      TextFieldInput.password(
                        controller: _passwordController,
                        hint: "Password",
                      ),
                      const SizedBox(height: AppDimens.largePadding),
                      if (_loginError != null)
                        Column(
                          children: [
                            Text(
                              "Bad login credentials",
                              style: AppTextStyles.smallRegularPoppins
                                  .copyWith(color: AppColors.red),
                            ),
                            const SizedBox(height: AppDimens.largePadding),
                          ],
                        ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GeneralButton(
                          onPressed: _onRegisterTap,
                          text: "Register",
                          minWidth: double.infinity,
                          minHeight: AppDimens.signInButtonHeight,
                        ),
                      ),
                      const SizedBox(height: AppDimens.largePadding),
                      Text(
                        "You already have an account?",
                        style: AppTextStyles.smallRegularPoppins
                            .copyWith(color: AppColors.gray),
                      ),
                      AppTextButton(
                        onPressed: _goToLogin,
                        text: "Login here",
                        color: AppColors.cyan,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
