import 'package:flutter/material.dart';

import 'package:myapp/helper/dbHelper.dart';
import 'package:myapp/model/theme_selection.dart';

class Participant {
  int? ptID;
  late int catID;
  late String name;

  Participant({this.ptID, required this.catID, required this.name});

  Participant.withoutId({this.ptID, required this.catID, required this.name});

  Map<String, dynamic> toMap() {
    return {
      DbHelper.memberColId: ptID,
      DbHelper.memberColGroupId: catID,
      DbHelper.memberColName: name,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      DbHelper.memberColGroupId: catID,
      DbHelper.memberColName: name,
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
        ptID: map[DbHelper.memberColId],
        catID: map[DbHelper.memberColGroupId],
        name: map[DbHelper.memberColName]);
  }
}

class Category {
  late int id;
  late String name;
  late ThemeSelection theme;
  String? subject;
  String? subSection;
  Category(
      {required this.id,
      required this.name,
      required this.theme,
      this.subject,
      this.subSection});

  Category.withoutId(
      {required this.name, required this.theme, this.subject, this.subSection});

  Map<String, dynamic> toMap() {
    return {
      DbHelper.groupColId: id,
      DbHelper.groupColName: name,
      DbHelper.groupColTheme: theme.name,
      DbHelper.groupColSubj: subject,
      DbHelper.groupColSubSection: subSection
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      DbHelper.groupColName: name,
      DbHelper.groupColTheme: theme.name,
      DbHelper.groupColSubj: subject,
      DbHelper.groupColSubSection: subSection
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map[DbHelper.groupColId],
      name: map[DbHelper.groupColName],
      theme: ThemeSelection.values
          .firstWhere((e) => e.name == map[DbHelper.groupColTheme]),
      subSection: map[DbHelper.groupColSubSection],
      subject: map[DbHelper.groupColSubj],
    );
  }

  Color get color => theme.color;
}

//for event Class
class Event {
  late int id;
  late String title;
  late String date;
  late int groupId;

  Event(
      {required this.id,
      required this.title,
      required this.date,
      required this.groupId});
  Event.withoutId(
      {required this.title, required this.date, required this.groupId});

  Map<String, dynamic> toMap() {
    return {
      DbHelper.eventColId: id,
      DbHelper.eventColName: title,
      DbHelper.eventColDate: date,
      DbHelper.eventColGroupId: groupId,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      DbHelper.eventColName: title,
      DbHelper.eventColDate: date,
      DbHelper.eventColGroupId: groupId,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
        id: map[DbHelper.eventColId],
        title: map[DbHelper.eventColName],
        date: map[DbHelper.eventColDate],
        groupId: map[DbHelper.eventColGroupId]);
  }
}
