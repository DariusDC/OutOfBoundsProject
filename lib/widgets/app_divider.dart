import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
    this.height = 1,
    this.verticalPadding = 0,
  }) : super(key: key);

  final double height;
  final double verticalPadding;

  factory AppDivider.padded({double height = 1}) => AppDivider(
    height: height,
    verticalPadding: AppDimens.regularPadding,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Divider(
        height: height,
        thickness: height,
        color: AppColors.darkGray,
      ),
    );
  }
}
