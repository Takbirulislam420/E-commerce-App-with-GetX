import 'package:get/get.dart';
import 'package:mkr_mart/core/service/api_url/api_urls.dart';
import 'package:mkr_mart/core/service/network/network_client.dart';
import 'package:mkr_mart/features/home/data/model/slider_model.dart';

class HomeSliderController extends GetxController {
  //Loading state
  bool _inProgress = false;
  List<SliderModel> _sliderList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<SliderModel> get sliderList => _sliderList;

  //Data model expose
  Future<bool> callSliderApi() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      ApiUrls.loadSliderUrl,
    );
    if (response.isSuccess) {
      List<SliderModel> list = [];
      for (Map<String, dynamic> loopSlider
          in response.responseData!['data']['results']) {
        list.add(SliderModel.fromJson(loopSlider));
      }
      _sliderList = list;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
