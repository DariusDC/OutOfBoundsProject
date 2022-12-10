import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/technology.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

import '../screens/technologies/technologies_screen.dart';

class TechnologiesCheckList extends StatefulWidget {
  final List<Technology> technologies;
  final VoidCallback? onItemTap;
  final Function(TechnologyType? type) onTechnologySelected;
  final void Function(List<Technology>) onSubmit;
  const TechnologiesCheckList({
    required this.technologies,
    required this.onSubmit,
    required this.onTechnologySelected,
    this.onItemTap,
    Key? key,
  }) : super(key: key);

  @override
  State<TechnologiesCheckList> createState() => _TechnologiesCheckListState();
}

class _TechnologiesCheckListState extends State<TechnologiesCheckList> {
  List<Technology> selectedTechnologies = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: AppDimens.largePadding),
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.smallPadding,
        horizontal: AppDimens.smallPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 2,
            color: AppColors.gray,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 5),
          ),
          if (widget.technologies.isEmpty)
            Center(
              child: Text("No technology available"),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...widget.technologies
                      .map(
                        (e) => GestureDetector(
                          onTap: widget.onItemTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.name,
                                      style: AppTextStyles.xLRegularPoppins
                                          .copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Checkbox(
                                        side: const BorderSide(
                                          color: AppColors.white,
                                        ),
                                        activeColor: AppColors.darkBlue,
                                        value: selectedTechnologies.contains(e),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == true) {
                                              selectedTechnologies.add(e);
                                            } else {
                                              selectedTechnologies.remove(e);
                                            }
                                          });
                                        }),
                                  ],
                                ),
                                Text(
                                  e.description,
                                  style: AppTextStyles.smallRegularPoppins
                                      .copyWith(
                                    color: AppColors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
          Container(
            height: 2,
            color: AppColors.gray,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: TechnologyTypeFilterWidget(
                  filters: TechnologyType.values,
                  onSelected: widget.onTechnologySelected,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: AppDimens.smallPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.darkBlue,
                      textStyle: AppTextStyles.mediumRegularPoppins.copyWith(
                        color: AppColors.white,
                      )),
                  onPressed: () => widget.onSubmit(selectedTechnologies),
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
