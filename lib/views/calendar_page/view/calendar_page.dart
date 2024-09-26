import 'package:calendar/views/calendar_page/controller/calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({Key? key}) : super(key: key);
  final CalendarController calendarController = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: TableCalendar(
              focusedDay: calendarController.focusDay.value,
              firstDay: DateTime.now(),
              lastDay: DateTime(2030),
              currentDay: calendarController.selectedDay.value,
              onDaySelected: (selectedDay, focusedDay) async {
                calendarController.focusDay.value = focusedDay;
                calendarController.selectedDay.value = selectedDay;
                calendarController.apiCall();
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Obx(() {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(16.0),
                          height: 400, // Adjust the height of the bottom sheet
                          child: calendarController.onLoad.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                )
                              : calendarController.calendarList.isEmpty
                                  ? Center(
                                      child: Text('No data found'),
                                    )
                                  : ListView.separated(
                                      itemCount: calendarController
                                          .calendarList.length,
                                      separatorBuilder: (context, index) =>
                                          Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: Divider(),
                                      ),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            titleDesc(
                                                title: 'Name',
                                                desc: calendarController
                                                    .calendarList[index].name),
                                            SizedBox(height: 16),
                                            titleDesc(
                                                title: 'Description',
                                                desc: calendarController
                                                    .calendarList[index]
                                                    .description),
                                            SizedBox(height: 16),
                                            titleDesc(
                                                title: 'Date',
                                                desc: calendarController
                                                    .calendarList[index].date),
                                          ],
                                        );
                                      },
                                    ));
                    });
                  },
                );
              },
            ),
          ),
        ),
      );
    });
  }

  titleDesc({required String title, required String desc}) {
    return Text(
      '$title: $desc',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
