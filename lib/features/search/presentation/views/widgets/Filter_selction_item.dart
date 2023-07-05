import 'package:flutter/material.dart';

class FilterSelctionItem extends StatelessWidget {
  const FilterSelctionItem({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), border: Border.all()),
        child: Text(text));
  }
}
