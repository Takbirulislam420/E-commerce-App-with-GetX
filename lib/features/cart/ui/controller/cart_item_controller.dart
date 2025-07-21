import 'package:get/get.dart';
import 'package:mkr_mart/core/service/api_url/api_urls.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/cart/data/model/cart_item_model.dart';

class CartItemController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<CartItemModel> _cartItemList = [];

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<CartItemModel> get cartItemList => _cartItemList;

  Future<bool> getCartItem() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      ApiUrls.getCartUrl,
    );
    if (response.isSuccess) {
      List<CartItemModel> list = [];
      for (Map<String, dynamic> json
          in response.responseData!['data']['results']) {
        list.add(CartItemModel.fromJson(json));
      }
      _cartItemList = list;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  double get totalPrice {
    double totalPrice = 0;
    for (CartItemModel cartItem in _cartItemList) {
      totalPrice += (cartItem.productModel.currentPrice * cartItem.quantity);
    }

    return totalPrice;
  }

  void updateQuantity(String cartItemId, int quantity) {
    for (CartItemModel cartItem in _cartItemList) {
      if (cartItem.id == cartItemId) {
        cartItem.quantity = quantity;
        update();
        break;
      }
    }
  }
}
