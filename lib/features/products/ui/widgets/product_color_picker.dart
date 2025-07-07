import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';

class ProductColorPicker extends StatefulWidget {
  const ProductColorPicker({
    super.key,
    required this.colorsList,
    required this.onSelectedColor,
  });

  final List<String> colorsList;
  final Function(String) onSelectedColor;

  @override
  State<ProductColorPicker> createState() => _ProductColorPickerState();
}

class _ProductColorPickerState extends State<ProductColorPicker> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String color in widget.colorsList)
          GestureDetector(
            onTap: () {
              _selectedColor = color;
              setState(() {});
              widget.onSelectedColor(_selectedColor!);
            },
            child: Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(right: 4),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _selectedColor == color ? AppColors.themeColors : null,

                border: Border.all(color: AppColors.themeColors),
              ),
              child: Text(
                color,
                style: TextStyle(
                  color: _selectedColor == color ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
