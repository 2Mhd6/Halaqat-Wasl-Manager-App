import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halaqat_wasl_manager_app/data/charity_data.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/helpers/formatted_data.dart';
import 'package:halaqat_wasl_manager_app/helpers/readable_location.dart';
import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';
import 'package:halaqat_wasl_manager_app/shared/set_up.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';
import 'package:halaqat_wasl_manager_app/ui/home/blocs/complaint_bloc/complaint_bloc.dart';
import 'package:halaqat_wasl_manager_app/ui/home/blocs/driver_bloc/driver_bloc.dart';
import 'package:halaqat_wasl_manager_app/ui/home/blocs/request_bloc/request_bloc.dart';
import 'package:halaqat_wasl_manager_app/ui/home/blocs/statistic_bloc/statistic_bloc.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/chips/complaint_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/dialogs/complaint_details_dialog.dart.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/dialogs/complaints_history.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/dialogs/drivers_dialog.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/chips/driver_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/dialogs/request_details_dialog.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/driver_section.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/main_section.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/chips/request_chip.dart';
import 'package:halaqat_wasl_manager_app/ui/home/widgets/chips/statistic_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RequestBloc()..add(FetchingDataFromDBEvent())),
        BlocProvider(
          create: (context) => DriverBloc()..add(GettingAllDriversEvent()),
        ),
        BlocProvider(
          create: (context) =>
              ComplaintBloc()..add(GettingAllComplaintsEvent()),
        ),
        BlocProvider(
          create: (context) => StatisticBloc()..add(GetStatisticEvent()),
        ),
      ],
      child: Builder(
        builder: (context) {
          final requestBloc = context.read<RequestBloc>();
          final driverBloc = context.read<DriverBloc>();
          final complaintBloc = context.read<ComplaintBloc>();
          final statisticBloc = context.read<StatisticBloc>();
          final charity = GetIt.I.get<CharityData>();

          return Scaffold(
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.only(left: 32, right: 32, top: 50),
                width: context.getWidth(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tr(
                              'home_screen.welcome',
                              args: [charity.charity.charityName],
                            ),
                            style: AppTextStyle.sfProBold40,
                          ),

                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Remove the request event
                                  requestBloc.add(FetchingDataFromDBEvent());

                                  // --
                                  driverBloc.add(GettingAllDriversEvent());
                                  statisticBloc.add(UpdatingStatisticEvent());
                                  complaintBloc.add(GettingAllComplaintsEvent());
                                },
                                icon: Icon(Icons.refresh),
                              ),

                              IconButton(
                                onPressed: () => SetupSupabase
                                    .sharedSupabase
                                    .client
                                    .auth
                                    .signOut(),
                                icon: Icon(
                                  Icons.logout_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Gap.gapH40,

                      BlocBuilder<StatisticBloc, StatisticState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StatisticChip(
                                label: 'home_screen.total_services',
                                statistic: (charity.charity.totalServices ?? 0)
                                    .toString(),
                                imagePath: 'assets/home/chart.png',
                              ),
                              StatisticChip(
                                label: 'home_screen.total_complaints',
                                statistic: (charity.complaints.length)
                                    .toString(),
                                imagePath: 'assets/home/error.png',
                              ),
                              StatisticChip(
                                label: 'home_screen.active_complaints',
                                statistic: charity.activeComplaints.length
                                    .toString(),
                                imagePath: 'assets/home/error.png',
                              ),
                            ],
                          );
                        },
                      ),

                      Gap.gapH56,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- Request Section ---
                          MainSection(
                            headerLabel: 'home_screen.requests',
                            viewAllLabel: 'home_screen.view_all',
                            onPressedViewAll: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  // return BlocProvider.value(
                                  //   value: ,
                                  //   child: Text('s'),
                                  // );

                                  return Text('sd');
                                },
                              );
                            },
                            emptyWidget: Center(
                              child: Text('Wow I think it\'s  empty for now'),
                            ),
                            children: [
                              Gap.gapH16,

                              BlocBuilder<RequestBloc, RequestState>(
                                builder: (context, state) {
                                  if (state is LoadingRequestState) {
                                    SizedBox(
                                      height: context.getHeight(
                                        multiplied: 0.5,
                                      ),
                                      width: context.getWidth(),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: charity.pendingRequests.length,
                                    itemBuilder: (context, index) {
                                      log('message');
                                      return RequestChip(
                                        request: charity.pendingRequests[index],
                                        onPressed: () async {
                                          // -- Setting up a request
                                          final request =
                                              charity.pendingRequests[index];
                                          driverBloc.add(
                                            GettingAvailableDriversEvent(
                                              request: charity
                                                  .pendingRequests[index],
                                            ),
                                          );
                                          final readableAddress =
                                              await ReadableLocation.readableAddress(
                                                request.pickupLat,
                                                request.pickupLong,
                                              );
                                          final formattedDate =
                                              FormattedData.formattedData(
                                                request.requestDate,
                                              );

                                          await Future.delayed(
                                            Duration(milliseconds: 400),
                                          );
                                          if (context.mounted) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return BlocProvider.value(
                                                  value: requestBloc,
                                                  child: RequestDetailsDialog(
                                                    request: charity
                                                        .pendingRequests[index],
                                                    availableDrivers: charity
                                                        .availableDrivers,
                                                    formattedDate:
                                                        formattedDate,
                                                    readableAddress:
                                                        readableAddress,
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),

                          // --- Driver Section ---
                          BlocProvider.value(
                            value: driverBloc,
                            child: DriverSection(
                              headerLabel: 'home_screen.drivers',
                              viewAllLabel: 'home_screen.view_all',
                              onPressedViewAll: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: driverBloc,
                                      child: DriversDialog(),
                                    );
                                  },
                                );
                              },
                              emptyWidget: Center(
                                child: Text('Wow I think it\'s  empty for now'),
                              ),
                              children: [
                                Gap.gapH24,
                                BlocBuilder<DriverBloc, DriverState>(
                                  builder: (context, state) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: charity.drivers.length,
                                      itemBuilder: (context, index) {
                                        return DriverChip(
                                          driver: charity.drivers[index],
                                          onPressed: () {},
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          // --- Complaints Section ---
                          MainSection(
                            headerLabel: 'home_screen.complaints',
                            viewAllLabel: 'home_screen.view_all',
                            onPressedViewAll: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return BlocProvider.value(
                                    value: complaintBloc,
                                    child: ComplaintsHistory(),
                                  );
                                },
                              );
                            },
                            emptyWidget: Center(
                              child: Text('Wow I think it\'s  empty for now'),
                            ),
                            children: [
                              Column(
                                children: [
                                  BlocBuilder<ComplaintBloc, ComplaintState>(
                                    builder: (context, state) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            charity.activeComplaints.length,
                                        itemBuilder: (context, index) {
                                          return ComplaintChip(
                                            complaint:
                                                charity.activeComplaints[index],
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return BlocProvider.value(
                                                    value: complaintBloc,
                                                    child: ComplaintDetailsDialog(
                                                      complaint: charity.activeComplaints[index],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  // ComplaintChip(
                                  //   onPressed: () {
                                  //     showDialog(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return ComplaintDetailsDialog();
                                  //       },
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
