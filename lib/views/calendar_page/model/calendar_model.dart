// To parse this JSON data, do
//
//     final calendarModel = calendarModelFromJson(jsonString);

import 'dart:convert';

List<CalendarModel> calendarModelFromJson(String str) =>
    List<CalendarModel>.from(
        json.decode(str).map((x) => CalendarModel.fromJson(x)));

String calendarModelToJson(List<CalendarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalendarModel {
  final String name;
  final String nameLocal;
  final String language;
  final String description;
  final String country;
  final String location;
  final String type;
  final String date;
  final String dateYear;
  final String dateMonth;
  final String dateDay;
  final String weekDay;

  CalendarModel({
    required this.name,
    required this.nameLocal,
    required this.language,
    required this.description,
    required this.country,
    required this.location,
    required this.type,
    required this.date,
    required this.dateYear,
    required this.dateMonth,
    required this.dateDay,
    required this.weekDay,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        name: json["name"] ?? '',
        nameLocal: json["name_local"] ?? '',
        language: json["language"] ?? '',
        description: json["description"] ?? '',
        country: json["country"] ?? '',
        location: json["location"] ?? '',
        type: json["type"] ?? '',
        date: json["date"] ?? '',
        dateYear: json["date_year"] ?? '',
        dateMonth: json["date_month"] ?? '',
        dateDay: json["date_day"] ?? '',
        weekDay: json["week_day"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_local": nameLocal,
        "language": language,
        "description": description,
        "country": country,
        "location": location,
        "type": type,
        "date": date,
        "date_year": dateYear,
        "date_month": dateMonth,
        "date_day": dateDay,
        "week_day": weekDay,
      };
}
