import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/screens/home.dart';
import 'package:out_of_bounds/screens/login/login_view_model.dart';
import 'package:out_of_bounds/screens/navigation/navigation.dart';
import 'package:out_of_bounds/screens/register/register_screen.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/buttons/app_text_button.dart';
import 'package:out_of_bounds/widgets/buttons/general_button.dart';
import 'package:out_of_bounds/widgets/inputs/text_field_input.dart';
import 'package:rxdart/rxdart.dart';

class LoginScreen extends StatefulWidget {
  final LoginComingFrom comingFrom;

  const LoginScreen({Key? key, this.comingFrom = LoginComingFrom.NONE})
      : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRequestScreen<LoginScreen> {
  late LoginViewModel _viewModel;
  Exception? _loginError;

  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel(
      Input(
        PublishSubject(),
      ),
    );

    fetchData(
      _viewModel.output.onLogin,
      handleValue: (loginData) {
        setState(() {
          _loginError = null;
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AppNavigation(),
        ));
      },
      handleError: (error) {
        if (error is DioError) {
          setState(() {
            _loginError = error;
          });
        }
      },
    );
  }

  _onLoginPressed() {
    _viewModel.input.login.add(
      UserLogin(_usernameController.text, _passwordController.text),
    );
  }

  _goToRegister() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const RegisterScreen(),
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
                        "Login",
                        style: AppTextStyles.x3LBoldPoppins,
                      ),
                      if (widget.comingFrom == LoginComingFrom.REGISTER)
                        Column(
                          children: [
                            const SizedBox(height: AppDimens.x4LPadding),
                            Text(
                              "Registered succesfully! Now you can log in.",
                              style: AppTextStyles.mediumBoldPoppins
                                  .copyWith(color: AppColors.darkGray),
                            )
                          ],
                        ),
                      const SizedBox(height: AppDimens.x4LPadding),
                      TextFieldInput(
                        controller: _usernameController,
                        hint: "Username",
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
                          onPressed: _onLoginPressed,
                          text: "Login",
                          minWidth: double.infinity,
                          minHeight: AppDimens.signInButtonHeight,
                        ),
                      ),
                      const SizedBox(height: AppDimens.largePadding),
                      Text(
                        "You don't have an account?",
                        style: AppTextStyles.smallRegularPoppins
                            .copyWith(color: AppColors.gray),
                      ),
                      AppTextButton(
                        onPressed: _goToRegister,
                        text: "Register here",
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

enum LoginComingFrom { NONE, REGISTER }
