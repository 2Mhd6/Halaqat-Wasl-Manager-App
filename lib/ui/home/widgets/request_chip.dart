import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/app_custom_button.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';

class RequestChip extends StatelessWidget {
  const RequestChip({super.key, this.request, required this.onPressed});

  final RequestModel? request;
  final void Function()? onPressed;

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
                Text('Ashwaq Saud', style: AppTextStyle.sfPro60020),
                Text(
                  '27/10/2027 - 10:00 Am',
                  style: AppTextStyle.sfProBold14SecondaryColor,
                ),
                Text(
                  'Alnrjsh → King Fahad Hospital',
                  style: AppTextStyle.sfProBold14SecondaryColor,
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.pendingBackgroundColor,
              ),
              child: Text(
                tr('home_screen.pending'),
                style: AppTextStyle.sfPro60014.copyWith(
                  color: AppColors.pendingForegroundColor,
                ),
              ),
            ),
          ],
        ),

        Gap.gapH16,

        // -- When we connect the supabase uncomment this
        // if(request?.state == 'pending')
        AppCustomButton(
          label: tr('home_screen.assign_driver'),
          buttonColor: AppColors.primaryAppColor,
          width: context.getWidth(),
          height: context.getHeight(multiplied: 0.04),
          onPressed: onPressed,
        ),
        
        if (request?.state == 'pending')
        Gap.gapH16,

        Divider(color: AppColors.secondaryColor, thickness: 2, height: 20,)
      ],
    );
  }
}
