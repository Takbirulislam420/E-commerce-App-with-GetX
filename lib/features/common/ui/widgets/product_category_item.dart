import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/products/ui/screen/product_list_screen.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductListScreen.name,
            arguments: "Computer",
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.themeColors.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.computer,
                color: AppColors.themeColors,
                size: 32,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Computer",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColors),
            ),
          ],
        ),
      ),
    );
  }
}
