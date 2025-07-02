import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/model/complaint_model/complaint_model.dart';
import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';

class HistoryChip extends StatelessWidget {
  const HistoryChip({
    super.key,
    this.request,
    this.complaint,
    required this.state,
  });

  final RequestModel? request;
  final ComplaintModel? complaint;
  final String state;

  ({String text, Color backgroundColor, Color foregroundColor}) get status {
    switch (state) {
      case 'pending':
        return (
          text: 'home_screen.pending',
          backgroundColor: AppColors.pendingBackgroundColor,
          foregroundColor: AppColors.pendingForegroundColor,
        );

      case 'completed':
        return (
          text: 'home_screen.completed',
          backgroundColor: AppColors.completedBackgroundColor,
          foregroundColor: AppColors.completedForegroundColor,
        );
      default:
        return (
          text: 'home_screen.accepted',
          backgroundColor: AppColors.acceptedBackgroundColor,
          foregroundColor: AppColors.acceptedForegroundColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('#Req-YF34', style: AppTextStyle.sfPro60020),
      trailing: Container(
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
    );
  }
}
