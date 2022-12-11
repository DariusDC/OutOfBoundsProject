import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/mentor.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class MentorListItem extends StatelessWidget {
  final Mentor? mentor;
  final Function(Mentor) onMentorTap;

  const MentorListItem(
      {Key? key, required this.mentor, required this.onMentorTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => mentor == null ? null : onMentorTap(mentor!),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.green),
        ),
        // color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppDimens.smallPadding,
                right: AppDimens.smallPadding,
                top: AppDimens.smallPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mentor?.fullName ?? "",
                    style: AppTextStyles.largeBoldPoppins,
                  ),
                  const Icon(Icons.arrow_drop_up)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: AppDimens.smallPadding,
                left: AppDimens.smallPadding,
                bottom: AppDimens.smallPadding,
              ),
              child: Text(
                mentor?.description ?? "",
                style: AppTextStyles.smallRegularPoppins,
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
