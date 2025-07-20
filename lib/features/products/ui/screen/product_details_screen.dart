import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/auth/ui/screen/login_screen.dart';
import 'package:mkr_mart/features/common/controller/auth_controller.dart';
import 'package:mkr_mart/features/common/function/show_snack_bar_message.dart';
import 'package:mkr_mart/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:mkr_mart/features/products/controller/add_to_cart_controller.dart';
import 'package:mkr_mart/features/products/controller/product_details_controller.dart';
import 'package:mkr_mart/features/products/model/product_details_model.dart';
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
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  final AddToCartController _addToCartController =
      Get.find<AddToCartController>();

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if (controller.inProgress) {
            return CenterCircularProgressIndicator();
          }
          if (controller.errorMessage != null) {
            return Text("Something wrong");
          }
          final ProductDetailsModel product = controller.productDetails;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductCarouselSlider(images: product.photoUrl!),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleSection(product),
                            reViewRowSection(),
                            colorNSizeSection(product),
                            descriptionSection(product),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildAddToCartSection(product),
            ],
          );
        },
      ),
    );
  }

  Widget descriptionSection(ProductDetailsModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(product.description, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget titleSection(ProductDetailsModel product) {
    return Text(
      product.title,
      maxLines: 4,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.6,
        color: Colors.black54,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget reViewRowSection() {
    return Row(
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
            Text("1.4", style: TextStyle(color: Colors.grey)),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text("Review", style: TextStyle(color: AppColors.themeColors)),
        ),
        Card(
          color: AppColors.themeColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(4),
          ),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.favorite_border, size: 18, color: Colors.white),
          ),
        ),
        Spacer(),
        IncrementDecrementButton(onChange: (int value) {}),
      ],
    );
  }

  Widget colorNSizeSection(ProductDetailsModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: product.colors!.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Color",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              ProductColorPicker(
                colorsList: product.colors!,
                onSelectedColor: (String value) {},
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
        Visibility(
          visible: product.sizes!.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Size",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              ProductSizePicker(
                sizeList: product.sizes!,
                onSelectedSize: (String value) {},
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartSection(ProductDetailsModel product) {
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
                "\$${product.currentPrice}",
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
            child: GetBuilder(
              init: _addToCartController,
              builder: (addController) {
                return Visibility(
                  visible: addController.inProgress == false,
                  replacement: CenterCircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: _onTapAddToCart,
                    child: Text("Add to cart"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapAddToCart() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      final bool result = await _addToCartController.addToCartRequest(
        widget.productId,
      );
      if (result) {
        // ignore: use_build_context_synchronously
        showSnackBarMessage(context, "Added to cart");
      }
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }
}
