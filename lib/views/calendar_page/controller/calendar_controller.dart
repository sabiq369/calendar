import 'dart:developer';
import 'dart:ffi';

import 'package:calendar/services/services.dart';
import 'package:calendar/views/calendar_page/model/calendar_model.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {
  var calendarList = <CalendarModel>[].obs;
  RxBool onLoad = false.obs;
  Rx<DateTime> focusDay = DateTime.now().obs, selectedDay = DateTime.now().obs;

  apiCall() async {
    onLoad.value = true;
    var data = await Services().getDateData(
      country: 'US',
      year: selectedDay.value.year,
      month: selectedDay.value.month,
      day: selectedDay.value.day,
    );

    if (data != null) {
      calendarList.value = List<CalendarModel>.from(
        data.data.map((x) => CalendarModel.fromJson(x)),
      );
      onLoad.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    apiCall();
  }
}
