import 'package:flutter/material.dart';
import 'package:out_of_bounds/screens/mentor_details/mentor_details_screen.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/widgets/elements/dialog/bottom_modal_sheet.dart';
import 'package:out_of_bounds/widgets/mentors_widgets/mentor_list_item.dart';

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
      description: "Full-Stack",
      reviews: [review],
    ),
    Mentor(
      firstName: "Darius",
      lastName: "Capolna",
      description: "Mobile",
      reviews: [review, review],
    ),
    Mentor(
      firstName: "Patrick",
      lastName: "Ondreovici",
      description: "AI",
      reviews: [review, review, review],
    ),
    Mentor(
      firstName: "Bogdan",
      lastName: "Pupeza",
      description: "Mobile",
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
      (context) => MentorDetailsScreen(mentor: mentor),
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
              (e) => MentorListItem(mentor: e, onMentorTap: onMentorTap),
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
