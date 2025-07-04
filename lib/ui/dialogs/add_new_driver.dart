import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/theme/app_color.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';

class AddDriverDialog extends StatelessWidget {
  const AddDriverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: context.getWidth(multiplied: 0.5),
        height: context.getHeight(multiplied: 0.65),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColor.secondaryButtonColor, 
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add New Driver", style: AppTextStyle.sfProBold40),
              const SizedBox(height: 24),

              _buildLabeledField("Full Name"),
              const SizedBox(height: 20),

              _buildLabeledField("Email"),
              const SizedBox(height: 20),

              _buildLabeledField("Password", isPassword: true),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Add Driver",
                    style: AppTextStyle.sfProBold16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//Each input field is built 
  Widget _buildLabeledField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.sfProBold16), 
        const SizedBox(height: 8),
        SizedBox(
          height: 56, 
          child: TextFormField(
            obscureText: isPassword, //To hide the password
            style: AppTextStyle.sfProBold16.copyWith( 
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: label,
              hintStyle: AppTextStyle.sfProBold16.copyWith(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFB0B7C3), 
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.primaryButtonColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
