import 'package:calendar/views/calendar_page/view/calendar_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Services {
  final Dio _dio = Dio();

  getDateData({
    required String country,
    required int year,
    required int month,
    required int day,
  }) async {
    print('|||||| country : $country');
    print('|||||| year : $year');
    print('|||||| month : $month');
    print('|||||| day : $day');
    try {
      var response = await _dio
          .get("https://holidays.abstractapi.com/v1/", queryParameters: {
        "api_key": "da27b520c38c4c00bacb60df92ff237c",
        "country": country,
        "year": year,
        "month": month,
        "day": day,
      });
      print('||||||||||| response ||||||||||||');
      print(response.data);
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      print('||||| Error ||||||||');
      print(e.toString());
      Get.offAll(() => CalendarPage());
    }
  }
}
