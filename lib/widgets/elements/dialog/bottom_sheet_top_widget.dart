import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class BottomSheetTopWidget extends StatelessWidget {
  final String title;
  final VoidCallback dismissTap;

  const BottomSheetTopWidget(
      {Key? key, required this.title, required this.dismissTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 54,
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: AppTextStyles.mediumRegularPoppins,
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: AppColors.darkBlue),
              onPressed: dismissTap,
              splashRadius: 5,
            ),
          ),
        ],
      ),
    );
  }
}
