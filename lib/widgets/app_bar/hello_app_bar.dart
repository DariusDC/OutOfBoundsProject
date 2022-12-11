import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/app_divider.dart';

class HelloAppBar extends StatelessWidget {
  final User? user;

  const HelloAppBar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.regularPadding,
            horizontal: AppDimens.largePadding,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              user == null ? "Hello" : "Hello, ${user!.fullName}",
              style: AppTextStyles.x2LBoldPoppins,
            ),
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}
