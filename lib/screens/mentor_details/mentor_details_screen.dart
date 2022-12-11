import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/mentor.dart';
import 'package:out_of_bounds/widgets/app_divider.dart';
import 'package:out_of_bounds/widgets/elements/dialog/bottom_sheet_top_widget.dart';

class MentorDetailsScreen extends StatefulWidget {
  final Mentor mentor;

  const MentorDetailsScreen({Key? key, required this.mentor}) : super(key: key);

  @override
  _MentorDetailsScreenState createState() => _MentorDetailsScreenState();
}

class _MentorDetailsScreenState extends State<MentorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BottomSheetTopWidget(
          title: widget.mentor.fullName,
          dismissTap: () => Navigator.of(context).pop(),
        ),
        const AppDivider(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Reviews:",
                    // style: AppTextStyles.largeBoldPoppins,
                  ),
                ),
                ...(widget.mentor.reviews
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            bottom: 10.0,
                            right: 10.0,
                          ),
                          child: Text("- $e"),
                        ))
                    .toList()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
