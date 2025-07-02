import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    super.key,
    required this.label,
    required this.buttonColor,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  final String label;
  final double width;
  final double height;
  final Color buttonColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: buttonColor,
      ),
      child: Text(label, style: AppTextStyle.sfProBold20),
    );
  }
}
