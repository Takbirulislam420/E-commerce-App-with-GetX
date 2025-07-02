import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mkr_mart/app/app_assets_path.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/home/ui/widgets/app_bar_button.dart';
import 'package:mkr_mart/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:mkr_mart/features/home/ui/widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String name = "/home_page";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 8),
              ProductSearchBar(),
              SizedBox(height: 8),
              HomeCarouselSlider(),
              SizedBox(height: 2),
              _buildSectionHeader(title: "Category", onTapSeeAll: () {}),
              _buildSectionHeader(title: "Popular", onTapSeeAll: () {}),
              _buildSectionHeader(title: "Special", onTapSeeAll: () {}),
              _buildSectionHeader(title: "New", onTapSeeAll: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(
            "See all",
            style: TextStyle(color: AppColors.themeColors),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AppAssetsPath.navLogoPath),
      actions: [
        AppBarButton(onTap: () {}, icons: Icons.person),
        SizedBox(width: 3),
        AppBarButton(onTap: () {}, icons: Icons.call),
        SizedBox(width: 3),
        AppBarButton(onTap: () {}, icons: Icons.notifications),
      ],
    );
  }
}
