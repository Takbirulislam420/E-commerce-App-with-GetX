import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:mkr_mart/features/common/ui/widgets/product_card.dart';
import 'package:mkr_mart/features/common/user_data_model/category_model.dart';
import 'package:mkr_mart/features/products/controller/product_list_by_category_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  static final String name = '/product-list';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListByCategoryController _byCategoryController =
      ProductListByCategoryController();

  @override
  void initState() {
    super.initState();
    _byCategoryController.getProductList(widget.categoryModel.id);
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _byCategoryController.getProductList(widget.categoryModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryModel.title)),
      body: GetBuilder(
        init: _byCategoryController,
        builder: (controller) {
          if (controller.initialLoadingInProgress) {
            return CenterCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.builder(
                    itemCount: controller.productListByCategory.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: ProductCard(
                          productModel: controller.productListByCategory[index],
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
    );
  }
}
