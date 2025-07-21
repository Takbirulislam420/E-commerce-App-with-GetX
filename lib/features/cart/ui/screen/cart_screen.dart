import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/cart/ui/controller/cart_item_controller.dart';
import 'package:mkr_mart/features/cart/ui/widget/cart_item.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:mkr_mart/features/common/ui/widgets/center_circular_progress_indicator.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartItemController _cartItemController = Get.find<CartItemController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartItemController.getCartItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        Get.find<MainBottomNavController>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart page"),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().moveToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: GetBuilder(
          init: _cartItemController,
          builder: (controller) {
            if (controller.inProgress) {
              return CenterCircularProgressIndicator();
            }
            if (controller.errorMessage != null) {
              return Center(child: Text(controller.errorMessage!));
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: ListView.separated(
                      itemCount: controller.cartItemList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartItemModel: controller.cartItemList[index],
                        );
                      },
                      separatorBuilder: (_, _) {
                        return SizedBox(height: 3);
                      },
                    ),
                  ),
                ),
                _buildAddCheckOutSection(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddCheckOutSection() {
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
                (_cartItemController.totalPrice).toString(),
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
            child: ElevatedButton(onPressed: () {}, child: Text("Check out")),
          ),
        ],
      ),
    );
  }
}
