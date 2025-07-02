import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';


class MainSection extends StatelessWidget {
  const MainSection({super.key, required this.headerLabel, required this.viewAllLabel, required this.onPressedViewAll, required this.emptyWidget,  this.children});

  final String headerLabel;
  final String viewAllLabel;
  final Widget emptyWidget;
  final void Function()? onPressedViewAll;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.getWidth(multiplied: 0.28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr(headerLabel), style: AppTextStyle.sfProBold32),

              SizedBox(
                height: context.getHeight(multiplied: 0.035),
                child: Column(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: onPressedViewAll,
                      child: Text(tr(viewAllLabel),style: AppTextStyle.sfProBold14ViewAll,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Gap.gapH8,

        Container(
          width: context.getWidth(multiplied: 0.3),
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: children ?? [emptyWidget]
            ),
          ),
        ),
      ],
    );
  }
}
