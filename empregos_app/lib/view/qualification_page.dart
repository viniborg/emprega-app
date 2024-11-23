import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/qualification_provider.dart';
import '../widgets/qualification_card.dart';

class QualificationsPage extends StatefulWidget {
  const QualificationsPage({super.key});

  @override
  _QualificationsPageState createState() => _QualificationsPageState();
}

class _QualificationsPageState extends State<QualificationsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QualificationsProvider>().findQualifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final qualificationsProvider = context.watch<QualificationsProvider>();

    if (qualificationsProvider.qualifications.isEmpty) {
      return const Center(child: Text('Nenhuma qualificação encontrada.'));
    }

    return ListView.builder(
      itemCount: qualificationsProvider.qualifications.length,
      itemBuilder: (context, index) {
        final qualification = qualificationsProvider.qualifications[index];
        return QualificacaoCard(qualificacao: qualification);
      },
    );
  }
}
