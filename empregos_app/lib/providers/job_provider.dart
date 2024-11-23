import 'package:flutter/material.dart';
import '../api/job_api.dart';
import '../models/job_model.dart';

class JobsProvider extends ChangeNotifier {
  List<JobModel> _vagas = [];

  List<JobModel> get vagas => _vagas;

  Future<List<JobModel>> findJobs() async {
    _vagas = await JobsApi().findJobsMock();
    notifyListeners();
    return _vagas;
  }
}
