import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/model/driver_model/driver_model.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';

class DriverChip extends StatelessWidget {
  const DriverChip({super.key, this.driver, required this.onPressed});

  final DriverModel? driver;
  final void Function()? onPressed;

  ({String text, Color backgroundColor, Color foregroundColor}) get status{
    switch (driver?.status) {
      case 'pending':
        return (text: 'home_screen.pending',backgroundColor: AppColors.pendingBackgroundColor, foregroundColor: AppColors.pendingForegroundColor);

      case 'on trip':
        return (text: 'home_screen.on_trip',backgroundColor: AppColors.acceptedBackgroundColor, foregroundColor: AppColors.acceptedForegroundColor);
      default:
       return (text: 'home_screen.pending',backgroundColor: AppColors.pendingForegroundColor, foregroundColor: AppColors.pendingBackgroundColor);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Osman Abdullah', style: AppTextStyle.sfPro60020),
                 Text('32 rides')
                // Text('${driver?.totalServices} ${driver!.totalServices.isEven ? 'rides' : 'ride'}')
              ],
            ),

            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: status.backgroundColor,
              ),
              child: Text(
                tr(status.text),
                style: AppTextStyle.sfPro60014.copyWith(
                  color: status.foregroundColor,
                ),
              ),
            ),
          ],
        ),

        Gap.gapH16,

        Divider(color: AppColors.secondaryColor, thickness: 2, height: 20),
      ],
    );
  }
}