import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/job_model.dart';

class JobsApi {
  Future<List<JobModel>> findJobsMock() async {
    try {
      final String response = await rootBundle.loadString('assets/job_mock.json');
      final List data = jsonDecode(response);
      return data.map((vaga) => JobModel.fromJson(vaga)).toList();
    } catch (e) {
      return [];
    }
  }
}
