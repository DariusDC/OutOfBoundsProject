import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';

class AppBottomModalSheet {
  static displayModalBottomSheet(BuildContext context, WidgetBuilder builder,
      {bool enableDrag = true, Color backgroundColor = AppColors.white}) {
    showMaterialModalBottomSheet(
        context: context,
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimens.appBottomModalBorderRadius),
          ),
        ),
        builder: builder,
        enableDrag: enableDrag ?? true);
  }
}
