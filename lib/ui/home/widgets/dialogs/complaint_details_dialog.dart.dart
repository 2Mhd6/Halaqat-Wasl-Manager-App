import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';
//Control the screen display state. Either viewOnly or allow responding
enum ComplaintStatus {
  viewOnly, // Before writing the reply
  responding, // After writing the reply
}

class ComplaintDetailsDialog extends StatelessWidget {
  const ComplaintDetailsDialog({
    super.key,
    this.status = ComplaintStatus.viewOnly, //Default value
  });

  final ComplaintStatus status;

  @override
  Widget build(BuildContext context) {
    final isResponding =
        status == ComplaintStatus.responding; //Activate writing and button.
    double width = context.getWidth(multiplied: 0.1);

    return Dialog(//size dialog
      child: Container(
        width: context.getWidth(multiplied: 0.5),
        height: context.getHeight(multiplied: 0.65),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Complaint data (address and date of request)
                Text("Complaint Details", style: AppTextStyle.sfProBold40),
                const SizedBox(height: 24),
//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('#REQ-004', style: AppTextStyle.sfProBold24),
                        SizedBox(height: 4),
                        Text(
                          'submitted 2 Hours ago',
                          style: AppTextStyle.sfProBold14,
                        ),
                      ],
                    ),
                    _buildStatusBox(),
                  ],
                ),
                const SizedBox(height: 24),

                // Driver, patient, number
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabeledText("Driver", "Khalid Abdullah"),
                    _buildLabeledText("Patient", "Ashwaq Saud"),
                    _buildLabeledText("Patient’s number", "+966500000000"),
                  ],
                ),
                const SizedBox(height: 24),

                // Complaint the Patient ( Read Only )
                const Text("Complaint", style: AppTextStyle.sfProBold16),

            
                const SizedBox(height: 8),
                _buildReadonlyBox(
                  "Driver was 30 minutes late and didn’t call to inform about the delay. Very unprofessional service.",
                ),
                const SizedBox(height: 24),

                // Response
                const Text("Response", style: AppTextStyle.sfProBold16),
                const SizedBox(height: 8),
                _buildResponseBox(isResponding),
                const SizedBox(height: 32),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isResponding
                        ? () {}
                        : null, //The button is automatically disabled if the status is not responding
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isResponding //Changes based on condition
                          ? AppColors.primaryButtonColor
                          : AppColors.secondaryButtonColor,
                      disabledForegroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Submit Response",style: AppTextStyle.sfProBold20,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //status for Complaint
  static Widget _buildStatusBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.completedBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Completed",
        style: AppTextStyle.sfProBold14.copyWith(
          color: AppColors.completedForegroundColor,
        ),
      ),
    );
  }

  // Label-value Color widget
  Widget _buildLabeledText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.sfProBold14),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyle.sfPro60014TernaryColor),
      ],
    );
  }

  // Static complaint box
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

  // Response field
  Widget _buildResponseBox(bool isEnabled) {
    return TextFormField(
      //Specifies whether the user can type into the field or not
      enabled: isEnabled,
      initialValue: isEnabled ? '' : "We’re really sorry...",
      maxLines: 5,
      decoration: InputDecoration(
        hintText: isEnabled ? 'Write your response...' : null,
        hintStyle: AppTextStyle.sfProRegular14.copyWith(
          color: AppColors.secondaryTextColor,
        ),
        filled: true,
        fillColor: const Color(0xFFF1F3F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      style: isEnabled
          ? AppTextStyle.sfProMedium14.copyWith(color: Colors.black)
          : AppTextStyle.sfProMedium14.copyWith(
              color: AppColors.secondaryTextColor,
            ),
    );
  }
}
