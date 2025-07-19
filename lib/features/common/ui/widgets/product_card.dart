import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_assets_path.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/products/model/product_model.dart';
import 'package:mkr_mart/features/products/ui/screen/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: productModel.id,
        );
      },
      child: Container(
        width: 140,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.themeColors.withOpacity(0.1),
              offset: Offset(0.0, 0.10),
              blurRadius: 5,
            ),
          ],
        ),

        child: Column(
          children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.themeColors.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.all(5),
              child:
                  (productModel.photoUrl!.isNotEmpty &&
                      productModel.photoUrl!.first.isNotEmpty)
                  ? Image.network(
                      productModel.photoUrl!.first,
                      height: 80,
                      width: 80,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppAssetsPath.dummyImage,
                          height: 80,
                          width: 80,
                        );
                      },
                    )
                  : Image.asset(
                      AppAssetsPath.dummyImage,
                      height: 80,
                      width: 80,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    productModel.title,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black54,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productModel.currentPrice,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.themeColors,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(Icons.star, size: 18, color: Colors.amber),
                          Text("1.4", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Card(
                        color: AppColors.themeColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(4),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.favorite_border,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
