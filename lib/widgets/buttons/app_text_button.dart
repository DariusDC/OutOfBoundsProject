import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;

  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = AppColors.blue,
  }) : super(key: key);

  factory AppTextButton.grey({
    Key? key,
    required VoidCallback? onPressed,
    required String text,
  }) {
    return AppTextButton(
      key: key,
      onPressed: onPressed,
      text: text,
      color: AppColors.darkGray2,
    );
  }

  factory AppTextButton.white({
    Key? key,
    required VoidCallback? onPressed,
    required String text,
  }) {
    return AppTextButton(
      key: key,
      onPressed: onPressed,
      text: text,
      color: AppColors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: AppTextStyles.largeBoldPoppins.apply(
          color: onPressed == null ? color.withOpacity(0.5) : color,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(color.withOpacity(0.1)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
