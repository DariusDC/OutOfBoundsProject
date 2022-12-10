import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';

class GenericCheckList extends StatefulWidget {
  final List<String> items;
  final VoidCallback? onItemTap;
  final void Function(List<String>) onSubmit;
  const GenericCheckList({
    required this.items,
    required this.onSubmit,
    this.onItemTap,
    Key? key,
  }) : super(key: key);

  @override
  State<GenericCheckList> createState() => _GenericCheckListState();
}

class _GenericCheckListState extends State<GenericCheckList> {
  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: AppDimens.largePadding),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.smallPadding,
        vertical: AppDimens.smallPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...widget.items
                .map(
                  (e) => GestureDetector(
                    onTap: widget.onItemTap,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e),
                          Checkbox(
                              value: selectedItems.contains(e),
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedItems.add(e);
                                  } else {
                                    selectedItems.remove(e);
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: AppDimens.smallPadding),
              child: ElevatedButton(
                onPressed: () => widget.onSubmit(selectedItems),
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}