import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mkr_mart/app/app_assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssetsPath.logoPath,
      width: width ?? 120,
      height: height,
      fit: BoxFit.scaleDown,
    );
  }
}
