import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/cart/data/model/cart_item_model.dart';
import 'package:mkr_mart/features/cart/ui/controller/cart_item_controller.dart';
import 'package:mkr_mart/features/products/ui/widgets/increment_decrement_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.white,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(8),
            child: Image.network(
              cartItemModel.productModel.photoUrl!.first,
              errorBuilder: (_, _, _) {
                return Center(child: Icon(Icons.error_outline));
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemModel.productModel.title,
                              maxLines: 1,

                              style: TextStyle(
                                fontSize: 16,

                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Size: ${cartItemModel.size}, Color: ${cartItemModel.color}",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_forever_outlined),
                      ),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (cartItemModel.productModel.currentPrice).toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.themeColors,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      IncrementDecrementButton(
                        onChange: (int value) {
                          Get.find<CartItemController>().updateQuantity(
                            cartItemModel.id,
                            value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
