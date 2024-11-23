import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, String>> notificacoes = [
    {
      'title': 'Candidatura recebida',
      'description': 'A empresa Librelato recebeu sua candidatura para a vaga para soldador.',
      'date': '20 de Novembro de 2024',
      'timeAgo': '1h'
    },
    {
      'title': 'Entrevista agendada',
      'description': 'Sua entrevista com a empresa Anjo para a vaga de operador de empilhadeira foi agendada.',
      'date': '18 de Novembro de 2024',
      'timeAgo': '2 dias'
    }
  ];

  void _removeNotification(int index) {
    setState(() {
      notificacoes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notificacoes.length,
        itemBuilder: (context, index) {
          final notification = notificacoes[index];
          return _buildNotificationCard(
            context,
            notification['title']!,
            notification['description']!,
            notification['date']!,
            notification['timeAgo']!,
            index,
          );
        },
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context,
      String title,
      String description,
      String date,
      String timeAgo,
      int index,
      ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color:  Color.fromRGBO(103, 58, 183, 1), size: 20,),
                  onPressed: () => _removeNotification(index),
                ),
              ],
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            Text(
              date,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              timeAgo,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
