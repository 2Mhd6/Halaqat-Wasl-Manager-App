import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';
import 'package:halaqat_wasl_manager_app/ui/home/complaint_bloc/complaint_bloc.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/complaint_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/complaints_history.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/driver_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/main_section.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/request_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/statistic_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ComplaintBloc())
      ],
      child: Builder(
        builder: (context) {

          final complaintBloc = context.read<ComplaintBloc>();

          return Scaffold(
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.only(left: 32,right: 32,top: 50),
                width: context.getWidth(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('home_screen.welcome', args: ['Sofana']), style: AppTextStyle.sfProBold40),
          
                      Gap.gapH40,
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StatisticChip(label: 'home_screen.total_services', statistic: '240', imagePath: 'assets/home/chart.png'),
                          StatisticChip(label: 'home_screen.total_complaints', statistic: '12', imagePath: 'assets/home/error.png'),
                          StatisticChip(label: 'home_screen.active_complaints', statistic: '3', imagePath: 'assets/home/error.png'),
                        ],
                      ),
          
                      Gap.gapH56,
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
          
                          MainSection(
                            headerLabel: 'home_screen.drivers', 
                            viewAllLabel: 'home_screen.view_all', 
                            onPressedViewAll: (){}, 
                            emptyWidget: Center(child: Text('Wow I think it\'s  empty for now'),),
                            children: [
                              Gap.gapH16,
                              RequestChip(onPressed: (){}),
                              RequestChip(onPressed: () {}),
                              RequestChip(onPressed: () {}),
                              RequestChip(onPressed: () {}),
                              RequestChip(onPressed: () {}),
                              RequestChip(onPressed: () {}),
                              RequestChip(onPressed: () {}),
                              RequestChip(onPressed: () {}),
                              RequestChip(onPressed: () {}),
                            ],
                          ),
          
                          MainSection(
                            headerLabel: 'home_screen.drivers',
                            viewAllLabel: 'home_screen.view_all',
                            onPressedViewAll: (){},
                            emptyWidget: Center(
                              child: Text('Wow I think it\'s  empty for now'),
                            ),
                            children: [
                              Column(
                                children: [
                                  Gap.gapH16,
                                  DriverChip(onPressed: () {}),
                                  DriverChip(onPressed: () {}),
                                  DriverChip(onPressed: () {}),
                                  DriverChip(onPressed: () {}),
                                ],
                              )
                            ]
                          ),
          
                          MainSection(
                            headerLabel: 'home_screen.complaints',
                            viewAllLabel: 'home_screen.view_all',
                            onPressedViewAll: () {
                              showDialog(context: context, builder: (context){
                                return BlocProvider.value(
                                  value: complaintBloc,
                                  child: ComplaintsHistory(),
                                );
                              });
                            },
                            emptyWidget: Center(
                              child: Text('Wow I think it\'s  empty for now'),
                            ),
                            children: [
                              Column(
                                children: [
                                  ComplaintChip(onPressed: (){})
                                ],
                              )
                            ],
                          )
          
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}