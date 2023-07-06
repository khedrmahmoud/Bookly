import 'package:bookly/core/utils/common/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class FilterSelctionItem extends StatelessWidget {
  const FilterSelctionItem({
    super.key,
    required this.text,
    required this.selected,
    required this.onSlected,
  });
  final String text;
  final bool selected;
  final void Function(bool value) onSlected;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      padding: const EdgeInsets.all(2),
      selectedColor: kPrimaryColor,
      selected: selected,
      backgroundColor: ColorManager.wightOp3,
      onSelected: onSlected,
    );
  }
}
