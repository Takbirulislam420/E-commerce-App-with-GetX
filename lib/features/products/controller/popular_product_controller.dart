import 'package:get/get.dart';
import 'package:mkr_mart/core/service/api_url/api_urls.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/products/model/product_model.dart';

class PopularProductController extends GetxController {
  //final int _count = 30;
  int _currentPage = 0;
  int? _lastPage = null;
  //Loading state
  bool _inProgress = false;
  bool _initialLoadingInProgress = false;
  List<ProductModel> _popularProductList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;
  bool get initialLoadingInProgress => _initialLoadingInProgress;
  String? get errorMessage => _errorMessage;
  List<ProductModel> get popularProductList => _popularProductList;

  // int get homeCategoryListLength => _productListByCategory.length > 10
  //     ? 10
  //     : _productListByCategory.length; //optional

  //Data model expose
  Future<void> getPopularProductList() async {
    _currentPage++;
    if (_lastPage != null && _lastPage! < _currentPage) {
      return;
    }
    if (_currentPage == 1) {
      _popularProductList.clear();
      _initialLoadingInProgress = true;
    } else {
      _inProgress = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      ApiUrls.productByTagUrl("Popular"),
    );
    if (response.isSuccess) {
      _lastPage = response.responseData!['data']['last_page'] ?? 0;
      List<ProductModel> list = [];
      for (Map<String, dynamic> loopProductList
          in response.responseData!['data']['results']) {
        list.add(ProductModel.fromJson(loopProductList));
      }
      _popularProductList.addAll(list);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    if (_currentPage == 1) {
      _initialLoadingInProgress = false;
    } else {
      _inProgress = false;
    }
    update();
  }
}
