import 'package:flutter/material.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({super.key});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (String? value) {},
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: "Search",
        border: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
