import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/job_provider.dart';
import '../widgets/vaga_card.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JobsProvider>().findJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobsProvider = context.watch<JobsProvider>();

    if (jobsProvider.vagas.isEmpty) {
      return const Center(child: Text('Nenhuma vaga encontrada.'));
    }

    return ListView.builder(
      itemCount: jobsProvider.vagas.length,
      itemBuilder: (context, index) {
        final job = jobsProvider.vagas[index];
        return VagaCard(vaga: job);
      },
    );
  }
}
