import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../utils/dialog_helper.dart';

class VagaCard extends StatelessWidget {
  final JobModel vaga;

  const VagaCard({required this.vaga, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(vaga.image),
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vaga.titulo,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${vaga.empresa} • ${vaga.localizacao}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              vaga.descricao,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => DialogHelper.showDetailsDialog(
                    context,
                    vaga.titulo,
                    Text(vaga.descricao),
                  ),
                  child: const Text('Ver mais', style: TextStyle(color: Color.fromRGBO(103, 58, 183, 1))),
                ),
                ElevatedButton(
                  onPressed: () {
                    _candidatarSe(context);
                  },
                  child: const Text('Candidatar-se'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(103, 58, 183, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _candidatarSe(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Candidatura enviada!'),
          content: Text('Você se candidatou para a vaga: ${vaga.titulo}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
