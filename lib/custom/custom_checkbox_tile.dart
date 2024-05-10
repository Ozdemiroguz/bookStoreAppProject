import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckboxTile extends StatelessWidget {
  const CustomCheckboxTile({
    required this.label,
    required this.value,
    required this.onChanged,
    this.labelColor,
    this.checkedColor,
    this.labelStyle,
  });

  final String label;
  final Color? labelColor;
  final Color? checkedColor;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          LimitedBox(
            maxHeight: 16.h,
            maxWidth: 16.w,
            child: Checkbox(
              activeColor: checkedColor,
              onChanged: onChanged,
              value: value,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              label,
              style: labelStyle,
            ),
          ),
        ],
      ),
    );
  }
}
