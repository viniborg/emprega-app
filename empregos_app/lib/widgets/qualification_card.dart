import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/qualification_model.dart';
import '../utils/dialog_helper.dart';

class QualificacaoCard extends StatelessWidget {
  final QualificationModel qualificacao;

  const QualificacaoCard({required this.qualificacao, super.key});

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
                Image.network(
                  qualificacao.imagemUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 80);
                  },
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        qualificacao.titulo,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${qualificacao.area} • ${qualificacao.nivel}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              qualificacao.descricao,
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
                    qualificacao.titulo,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          qualificacao.imagemUrl,
                          height: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image, size: 150);
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(qualificacao.descricao),
                      ],
                    ),
                  ),
                  child: const Text('Ver mais', style: TextStyle(color: Color.fromRGBO(103, 58, 183, 1))),
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchURL('https://google.com');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Iniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
