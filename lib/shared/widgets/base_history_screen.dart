import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_color.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';

// Screen that displays a history of requests or complaints filtered by selected days
class BaseHistoryScreen extends StatelessWidget {
  const BaseHistoryScreen({
    super.key,
    required this.title,
    this.selectedIndex = 0,
    this.requests = const [],
    required this.isLoading,
    this.onDaySelected,
  });
  final String title; // Screen title

  final int selectedIndex; // Currently selected index for day filter

  final List<Object> requests;

  final bool isLoading; // Indicates if data is loading

  final Function(int index)? onDaySelected; // Callback when a different day is selected

  @override
  Widget build(BuildContext context) {
    final days = [7, 14, 30, 60, 90];
    return SizedBox(
      height: 782,
      width: 722,
      child: Material(
        color: Color(0xffF9FAFC),
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the screen title
              Text(title, style: AppTextStyle.sfProBold40),
              Gap.gapH16,

              // Text field to search request number
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Request Number ...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap.gapH16,

              // Buttons to filter requests by days
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(days.length, (index) {
                  final isSelected = selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        onDaySelected?.call(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? AppColor.primaryAppColor
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        '${days[index]} days',
                        style: AppTextStyle.sfProBold16.copyWith(
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Gap.gapH16,

              // Show total number of requests or complaints
              Text(
                'Total Requests: ${requests.length}',
                style: AppTextStyle.sfProBold13.copyWith(color: Colors.grey),
              ),
              Gap.gapH16,

              // Show loading indicator, list of requests, or empty message
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : requests.isEmpty
                  ? Center(
                      child: Text(
                        'No Requests Found',
                        style: AppTextStyle.sfPro60020.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 312 / 125,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: requests.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(16.0),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              // Top row: Request number + status
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Request #${index + 1}',
                                      style: AppTextStyle.sfPro60020,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffDCFCE6),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      child: Text(
                                        'Copmleted',
                                        style: AppTextStyle.sfPro60014.copyWith(
                                          color: Color(0xff16803C),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Gap.gapH8,
                                // Request description
                                Text(
                                  'Request Details for Request #${index + 1}',
                                  style: AppTextStyle.sfPro60014.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                                Gap.gapH8,
                                // Request date (dummy date)
                                Text(
                                  'Date: ${DateTime.now().subtract(Duration(days: index + 1)).toLocal().toIso8601String().split('T')[0]}',
                                  style: AppTextStyle.sfPro60014.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
