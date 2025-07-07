import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';

class ProductSizePicker extends StatefulWidget {
  const ProductSizePicker({
    super.key,
    required this.sizeList,
    required this.onSelectedSize,
  });

  final List<String> sizeList;
  final Function(String) onSelectedSize;

  @override
  State<ProductSizePicker> createState() => _ProductSizePickerState();
}

class _ProductSizePickerState extends State<ProductSizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String productSize in widget.sizeList)
          GestureDetector(
            onTap: () {
              _selectedSize = productSize;
              setState(() {});
              widget.onSelectedSize(_selectedSize!);
            },
            child: Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(right: 4),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _selectedSize == productSize
                    ? AppColors.themeColors
                    : null,

                border: Border.all(color: AppColors.themeColors),
              ),
              child: Text(
                productSize,
                style: TextStyle(
                  color: _selectedSize == productSize
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
