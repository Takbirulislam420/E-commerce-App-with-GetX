import 'package:get/get.dart';
import 'package:mkr_mart/core/service/api_url/api_urls.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/common/user_data_model/category_model.dart';

class CategoryListController extends GetxController {
  final int _count = 30;
  int _currentPage = 0;
  int? _lastPage = null;
  //Loading state
  bool _inProgress = false;
  bool _initialLoadingInProgress = false;
  List<CategoryModel> _categoryList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;
  bool get initialLoadingInProgress => _initialLoadingInProgress;
  String? get errorMessage => _errorMessage;
  List<CategoryModel> get categoryList => _categoryList;
  int get homeCategoryListLength =>
      _categoryList.length > 10 ? 10 : _categoryList.length;

  //Data model expose
  Future<void> getCategoryList() async {
    _currentPage++;
    if (_lastPage != null && _lastPage! < _currentPage) {
      return;
    }
    if (_currentPage == 1) {
      _categoryList.clear();
      _initialLoadingInProgress = true;
    } else {
      _inProgress = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      ApiUrls.categoryListUrl(_count, _currentPage),
    );
    if (response.isSuccess) {
      _lastPage = response.responseData!['data']['last_page'] ?? 0;
      List<CategoryModel> list = [];
      for (Map<String, dynamic> loopCategoryList
          in response.responseData!['data']['results']) {
        list.add(CategoryModel.fromJson(loopCategoryList));
      }
      _categoryList.addAll(list);
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
