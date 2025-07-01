import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/theme/app_color.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';

class RequestDetailsDialog extends StatelessWidget {
  const RequestDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedDriver;


    return Dialog(
      ////size dialog
      child: Container(
        width: context.getWidth(multiplied: 0.5),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            //// request number and status
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Request Details", style: AppTextStyle.sfProBold40),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("#REQ-004", style: AppTextStyle.sfProBold24),
                      SizedBox(height: 4),

                      Text(
                        "submitted 2 Hours ago",
                        style: AppTextStyle.sfProBold14,
                      ),
                    ],
                  ),
                  _buildStatusBox("Pending"),
                ],
              ),

              const SizedBox(height: 24),
              const Text("Ashwaq Saud", style: AppTextStyle.sfProBold20),
              const SizedBox(height: 24),

              // Information request ( Pickup - Destination - Time )
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLabeledText("Pick up", "Riyadh ,Tuwaiq Academy"),
                  _buildLabeledText(
                    "Destination",
                    "Riyadh ,(Al Amal) Mental\nHealth Complex",
                  ),
                  _buildLabeledText("Time & Date", "27/10/2026\n10 : 00 AM"),
                ],
              ),

              const SizedBox(height: 24),

              // Special Needs or notes ( only read )
              const Text(
                "Special Need",
                style: TextStyle(
                  color: AppColor.primaryButtonColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              _buildReadonlyBox(
                "Patient needs wheelchair assistance. Appointment at cardiology department.",
              ),

              const SizedBox(height: 24),
              const Text(
                "Select a driver",
                style: TextStyle(
                  color: AppColor.primaryButtonColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 4),

              DropdownButtonFormField<String>(
                value: selectedDriver,
                decoration: InputDecoration(
                  hintText: ('Select a driver'),
                  labelStyle: AppTextStyle.sfProMedium14,
                  filled: true,
                  fillColor: const Color(0xFFF1F3F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: ["Ahmed Ali", "Saud Naser", "Waleed Khalid"].map((d) {
                  return DropdownMenuItem(
                    value: d,
                    child: Text(d, style: AppTextStyle.sfProMedium14),
                  );
                }).toList(),
                onChanged: (v) {
                  //   //setState(() => selectedDriver = v);
                },
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Accept Request",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Order status in custom color according to the status
  Widget _buildStatusBox(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColor.pendingBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: AppTextStyle.sfProBold14.copyWith(
          color: AppColor.pendingForegroundColor,
        ),
      ),
    );
  }

  //Displays title + content
  Widget _buildLabeledText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.sfProBold14),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(color: AppColor.primaryButtonColor),
          maxLines: 2,
        ),
      ],
    );
  }

  //notes read only
  Widget _buildReadonlyBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: AppTextStyle.sfProMedium14.copyWith(color: Colors.black),
      ),
    );
  }
}
