import 'package:cloud_firestore/cloud_firestore.dart';

class PetRemedyInfo {
  DateTime date;
  String name;
  bool isRecurrent;
  int? recurrenceInDays;

  PetRemedyInfo({
    required this.date,
    required this.name,
    required this.isRecurrent,
    this.recurrenceInDays,
  });
}
