import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';

class IncrementDecrementButton extends StatefulWidget {
  const IncrementDecrementButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          onTap: () {
            if (value <= 1) return;
            value--;
            setState(() {});
            widget.onChange(value);
          },
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text("$value ", style: TextStyle(fontSize: 18)),
        ),
        _buildIconButton(
          onTap: () {
            if (value >= 20) return;
            value++;
            setState(() {});
            widget.onChange(value);
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: AppColors.themeColors,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon, size: 23, color: Colors.white),
      ),
    );
  }
}
