import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';

class AppProgressBar extends StatelessWidget {
  final double currentProgress;

  const AppProgressBar({Key? key, required this.currentProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.progressBarWidth,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              height: AppDimens.progressBarHeight,
              width: double.infinity,
              color: AppColors.lightGray,
              // width: (currentProgress * 100) * AppDimens.progressBarWidth / 100,
            ),
            Container(
              height: AppDimens.progressBarHeight,
              color: AppColors.green,
              width: (currentProgress * 100) * AppDimens.progressBarWidth / 100,
              // child:
            ),
          ],
        ),
      ),
    );
  }
}
