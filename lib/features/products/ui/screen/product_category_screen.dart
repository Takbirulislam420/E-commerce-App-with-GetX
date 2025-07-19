import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/features/common/controller/category_list_controller.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:mkr_mart/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:mkr_mart/features/common/ui/widgets/product_category_item.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});
  static final String name = "/product_category";

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  final CategoryListController _categoryListController =
      Get.find<CategoryListController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryListController.getCategoryList();
    }
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
          title: Text("Categories"),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().moveToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: GetBuilder<CategoryListController>(
          builder: (controller) {
            if (controller.initialLoadingInProgress) {
              return CenterCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: controller.categoryList.length,
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: ProductCategoryItem(
                            categoryModel: controller.categoryList[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.inProgress,
                  child: LinearProgressIndicator(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
