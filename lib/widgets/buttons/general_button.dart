import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class GeneralButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double minWidth;
  final double minHeight;

  const GeneralButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.minWidth = 0,
    this.minHeight = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(
          text,
          style: AppTextStyles.xLBoldPoppins,
          overflow: TextOverflow.ellipsis,
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: AppDimens.regularPadding,
              horizontal: AppDimens.largePadding,
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(
              minWidth,
              minHeight,
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.yellow),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.largeCorners),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            offset: const Offset(0, 8),
            blurRadius: 12,
          )
        ],
      ),
      height: AppDimens.generalButtonHeight,
    );
  }
}
