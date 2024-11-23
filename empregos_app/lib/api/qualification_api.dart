import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/qualification_model.dart';

class QualificationsApi {
  Future<List<QualificationModel>> findQualificationsMock() async {
    try {
      final String response = await rootBundle.loadString('assets/qualification_mock.json');
      final List data = jsonDecode(response);
      return data.map((vaga) => QualificationModel.fromJson(vaga)).toList();
    } catch (e) {
      return [];
    }
  }
}
