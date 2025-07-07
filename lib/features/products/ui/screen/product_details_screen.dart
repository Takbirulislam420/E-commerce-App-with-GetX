import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/products/ui/widgets/product_color_picker.dart';
import 'package:mkr_mart/features/products/ui/widgets/increment_decrement_button.dart';
import 'package:mkr_mart/features/products/ui/widgets/product_carousel_slider.dart';
import 'package:mkr_mart/features/products/ui/widgets/product_size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  static final String name = "/product-details-screen";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         "Nike New shows,come from new Nike New shows,come from new  New shows,come from new",
                        //         maxLines: 2,
                        //         style: TextStyle(
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.w700,
                        //           letterSpacing: 0.6,
                        //           color: Colors.black54,
                        //           overflow: TextOverflow.ellipsis,
                        //         ),
                        //       ),
                        //     ),
                        //     IncrementDecrementButton(onChange: (int value) {}),
                        //   ],
                        // ),
                        Text(
                          "Nike New shows,come from new Nike  world the country New shows,come from new",
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.6,
                            color: Colors.black54,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //   '\$100 ',
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: AppColors.themeColors,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                            Wrap(
                              children: [
                                Icon(Icons.star, size: 18, color: Colors.amber),
                                Text(
                                  "1.4",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Review",
                                style: TextStyle(color: AppColors.themeColors),
                              ),
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
                            Spacer(),
                            IncrementDecrementButton(onChange: (int value) {}),
                          ],
                        ),
                        Text(
                          "Color",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        ProductColorPicker(
                          colorsList: ["Grey", "Green", "Red"],
                          onSelectedColor: (String value) {},
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        ProductSizePicker(
                          sizeList: ["S", "M", "L", "XL", "XXL"],
                          onSelectedSize: (String value) {},
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '''The official Mac mini M4 16GB/256GB is now available in Bangladesh at a starting price of ৳70,900. For the best price, official warranty, and delivery across the country, shop directly at Gadget BD.The official Mac mini M4 16GB/256GB is now available in Bangladesh at a starting price of ৳70,900. For the best price, official warranty, and delivery across the country, shop directly at Gadget BD.''',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildAddToCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 85,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.themeColors.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Price", style: Theme.of(context).textTheme.bodyLarge),
              Text(
                "\$1000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.themeColors,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: Text("Add to cart")),
          ),
        ],
      ),
    );
  }
}
