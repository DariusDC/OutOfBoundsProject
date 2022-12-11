import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';

import '../../model/technology.dart';
import '../../themes/app_text_styles.dart';
import '../../widgets/app_bar/app_bar_right_widget.dart';
import '../../widgets/generic_check_list.dart';

class TechnologiesScreen extends StatefulWidget {
  final Function(List<Technology>) onSubmit;
  const TechnologiesScreen({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<TechnologiesScreen> createState() => _TechnologiesScreenState();
}

class _TechnologiesScreenState extends State<TechnologiesScreen> {
  final List<Technology> _technologies = [
    Technology(
      name: "Kotlin",
      type: TechnologyType.mobile,
    ),
    Technology(
      name: "Swift",
      type: TechnologyType.mobile,
    ),
    Technology(
      name: "Flutter",
      type: TechnologyType.mobile,
    ),
    Technology(
      name: "React",
      type: TechnologyType.frontEnd,
    ),
    Technology(
      name: "Angular",
      type: TechnologyType.frontEnd,
    ),
    Technology(
      name: "Java Spring Boot",
      type: TechnologyType.backEnd,
    ),
    Technology(
      name: "C++",
      type: TechnologyType.ai,
    ),
    Technology(
      name: "Python",
      type: TechnologyType.fullStack,
    ),
  ];
  List<Technology> _technologyList = [];

  @override
  void initState() {
    _technologyList = _technologies;
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
              buttonText: "Cancel",
              title: "Technologies",
              onButtonPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Flexible(
              child: TechnologiesCheckList(
                technologies: _technologyList,
                onSubmit: (selectedTechnologies) {
                  widget.onSubmit(selectedTechnologies);
                  Navigator.of(context).pop();
                },
                onTechnologySelected: _onTechnologySelected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTechnologySelected(TechnologyType? type) {
    setState(() {
      if (type == TechnologyType.any) {
        _technologyList = _technologies;
      } else {
        _technologyList =
            _technologies.where((element) => element.type == type).toList();
      }
    });
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
