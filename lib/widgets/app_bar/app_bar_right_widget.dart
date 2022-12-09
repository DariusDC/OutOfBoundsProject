import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/buttons/app_text_button.dart';

class AppBarRightWidget extends StatelessWidget {
  const AppBarRightWidget({
    Key? key,
    required this.onButtonPressed,
    required this.title,
    this.buttonText = "",
    this.buttonKey,
  }) : super(key: key);

  final Key? buttonKey;
  final VoidCallback onButtonPressed;
  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppDimens.regularPadding,
        left: AppDimens.regularPadding,
        right: AppDimens.regularPadding,
      ),
      child: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        title: Text(
          title,
          style: AppTextStyles.x4LSemiBoldPoppins,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.smallPadding,
            ),
            child: AppTextButton(
              key: buttonKey,
              onPressed: onButtonPressed,
              text: buttonText,
            ),
          )
        ],
      ),
    );
  }
}
