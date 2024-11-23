import 'package:flutter/material.dart';
import '../models/user_model.dart';

class CurriculoPage extends StatefulWidget {
  final User usuario;

  const CurriculoPage({required this.usuario, super.key});

  @override
  _CurriculoPageState createState() => _CurriculoPageState();
}

class _CurriculoPageState extends State<CurriculoPage> {
  final _formKey = GlobalKey<FormState>();
  late String _objetivo;
  late String _experiencia;
  late String _educacao;
  late String _habilidades;
  late String _idiomas;
  late String _certificacoes;
  late String _projetos;

  void _saveCurriculo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currículo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Objetivo Profissional'),
                onSaved: (value) {
                  _objetivo = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu objetivo profissional';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Experiência Profissional'),
                onSaved: (value) {
                  _experiencia = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua experiência profissional';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Educação'),
                onSaved: (value) {
                  _educacao = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua educação';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Habilidades'),
                onSaved: (value) {
                  _habilidades = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira suas habilidades';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Idiomas'),
                onSaved: (value) {
                  _idiomas = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira os idiomas que você fala';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Certificações'),
                onSaved: (value) {
                  _certificacoes = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira suas certificações';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Projetos'),
                onSaved: (value) {
                  _projetos = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seus projetos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCurriculo,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
