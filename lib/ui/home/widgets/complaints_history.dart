import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';
import 'package:halaqat_wasl_manager_app/ui/home/complaint_bloc/complaint_bloc.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/date_range_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/history_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/shared/search_textfield.dart';

class ComplaintsHistory extends StatelessWidget {
  const ComplaintsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final complaintBloc = context.read<ComplaintBloc>();

    return DefaultTabController(
      length: 5,
      child: Dialog(
        child: Container(
          width: context.getWidth(multiplied: 0.52),
          height: context.getHeight(multiplied: 0.6),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: AppColors.appBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('complaint_history_dialog.complaint_history'),
                  style: AppTextStyle.sfProBold40,
                ),

                Gap.gapH24,

                SearchTextfield(label: 'complaint_history_dialog.search_number_request', controller: TextEditingController()),

                Gap.gapH16,

                BlocBuilder<ComplaintBloc, ComplaintState>(
                  builder: (context, state) {
                    return TabBar(
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      onTap: (value){
                        complaintBloc.add(ChangeDateRangeEvent(selectedIndex: value));
                        complaintBloc.add(GettingDataBasedOnDate());
                      },
                      tabs: [
                        DateRangeChip(
                          label: '7 Days',
                          tabIndex: 0,
                          selectedIndex: complaintBloc.selectedIndex,
                        ),
                        DateRangeChip(
                          label: '14 Days',
                          tabIndex: 1,
                          selectedIndex: complaintBloc.selectedIndex,
                        ),
                        DateRangeChip(
                          label: '30 Days',
                          tabIndex: 2,
                          selectedIndex: complaintBloc.selectedIndex,
                        ),
                        DateRangeChip(
                          label: '60 Days',
                          tabIndex: 3,
                          selectedIndex: complaintBloc.selectedIndex,
                        ),
                        DateRangeChip(
                          label: '90 Days',
                          tabIndex: 4,
                          selectedIndex: complaintBloc.selectedIndex,
                        ),
                      ],
                    );
                  },
                ),

                Gap.gapH16,

                BlocBuilder<ComplaintBloc, ComplaintState>(
                  builder: (context, state) {

                    if(state is LoadingState){
                      return SizedBox(
                        width: context.getWidth(),
                        height: context.getHeight(multiplied: 0.3),
                        child: Center(child: CircularProgressIndicator(),),
                      );
                    }
                    return Column(
                      children: [
                        Row(
                          children: [
                            Gap.gapW24,
                            Text('Total Records: ${complaintBloc.complaints.length}',style: AppTextStyle.sfProBold13.copyWith(color: AppColors.secondaryTextColor)),
                          ],
                        ),

                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 40,
                                childAspectRatio: 3,
                              ),
                          itemCount: complaintBloc.complaints.length,
                          itemBuilder: (context, index) {
                            return HistoryChip(state: 'completed');
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
