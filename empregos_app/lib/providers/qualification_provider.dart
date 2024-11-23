import 'package:empregos_app/api/qualification_api.dart';
import 'package:flutter/material.dart';
import '../models/qualification_model.dart';

class QualificationsProvider extends ChangeNotifier {
  List<QualificationModel> _qualifications = [];

  List<QualificationModel> get qualifications => _qualifications;

  Future<List<QualificationModel>> findQualifications() async {
    _qualifications = await QualificationsApi().findQualificationsMock();
    notifyListeners();
    return _qualifications;
  }
}
