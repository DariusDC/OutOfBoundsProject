import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/widgets/elements/dialog/bottom_modal_sheet.dart';

import '../../model/mentor.dart';
import '../../model/technology.dart';
import '../../themes/app_text_styles.dart';
import '../../widgets/app_bar/app_bar_right_widget.dart';
import '../../widgets/app_divider.dart';
import '../../widgets/elements/dialog/bottom_sheet_top_widget.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  static const String review =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  final List<Mentor> _mentors = [
    Mentor(
      firstName: "Ionut",
      lastName: "Constantin",
      reviews: [review],
    ),
    Mentor(
      firstName: "Darius",
      lastName: "Capolna",
      reviews: [review, review],
    ),
    Mentor(
      firstName: "Patrick",
      lastName: "Ondreovici",
      reviews: [review, review, review],
    ),
    Mentor(
      firstName: "Bogdan",
      lastName: "Pupeza",
      reviews: [review, review, review, review],
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            AppBarRightWidget(
              buttonText: "Back",
              title: "Mentors",
              onButtonPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              height: 2,
              color: AppColors.gray,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Flexible(
              child: MentorsList(
                mentors: _mentors,
                onMentorTap: _onMentorTap,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMentorTap(Mentor mentor) {
    AppBottomModalSheet.displayModalBottomSheet(
      context,
      (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetTopWidget(
            title: mentor.fullName,
            dismissTap: () => Navigator.of(context).pop(),
          ),
          const AppDivider(),
          Container(
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
                  ...(mentor.reviews
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
      ),
    );
  }
}

class MentorsList extends StatelessWidget {
  final List<Mentor> mentors;
  final Function(Mentor mentor) onMentorTap;

  const MentorsList({
    required this.mentors,
    required this.onMentorTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: mentors
            .map(
              (e) => GestureDetector(
                onTap: () => onMentorTap(e),
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
                              e.fullName,
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
                          e.description,
                          style: AppTextStyles.smallRegularPoppins,
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class TechnologyTypeFilterWidget extends StatefulWidget {
  final List<TechnologyType> filters;
  final Function(TechnologyType?) onSelected;
  const TechnologyTypeFilterWidget({
    Key? key,
    required this.onSelected,
    required this.filters,
  }) : super(key: key);

  @override
  State<TechnologyTypeFilterWidget> createState() =>
      _TechnologyTypeFilterWidgetState();
}

class _TechnologyTypeFilterWidgetState
    extends State<TechnologyTypeFilterWidget> {
  TechnologyType? _selectedFilter = TechnologyType.any;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<TechnologyType>(
          icon: const Icon(Icons.arrow_drop_up_outlined),
          style: AppTextStyles.largeBoldPoppins,
          value: _selectedFilter,
          items: widget.filters
              .map(
                (e) => DropdownMenuItem<TechnologyType>(
                  child: Text(e.textValue),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (e) {
            setState(() {
              _selectedFilter = e;
              widget.onSelected(_selectedFilter);
            });
          },
        ),
      ],
    );
  }
}
