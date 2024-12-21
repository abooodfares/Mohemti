// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Taskmodel {
  final String id;
  String? title;
  TimeOfDay? time;
  DateTime? date;
  int? reminder;
  String? category;
  String? dayrepeat;
  int? ranking;
  Taskmodel({
    required this.id,
    this.title,
    this.time,
    this.date,
    this.reminder,
    this.category,
    this.dayrepeat,
    this.ranking,
  });
}
