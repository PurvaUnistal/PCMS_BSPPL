import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final String label;
  final bool selectedValue;
  final ValueChanged<bool?> onChanged;
  const CheckBoxWidget({Key? key,
    required this.label,
    required this.selectedValue,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   /* return CheckboxListTile(
      title: Text(label),
      value: selectedValue,
      onChanged:onChanged,
    );*/
    return Row(
      children: [
        Checkbox(
          value: selectedValue,
          onChanged: onChanged
        ),
        Text(label),
      ],
    );

  }
}
