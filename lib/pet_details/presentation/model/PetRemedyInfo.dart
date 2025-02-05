import 'package:cloud_firestore/cloud_firestore.dart';

class PetRemedyInfo {
  int Id;
  DateTime date;
  String name;
  bool isRecurrent;
  int? recurrenceInDays;

  PetRemedyInfo({
    this.Id = 0,
    required this.date,
    required this.name,
    required this.isRecurrent,
    this.recurrenceInDays,
  });
}
