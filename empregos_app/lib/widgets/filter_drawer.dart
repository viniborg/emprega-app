import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  final Function(Map<String, bool>, Map<String, bool>, Map<String, bool>) applyFilters;
  const FilterDrawer({required this.applyFilters, super.key});

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final List<String> cities = [
    'São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Porto Alegre', 'Curitiba',
    'Salvador', 'Recife', 'Brasília', 'Fortaleza', 'Manaus'
  ];
  final Map<String, bool> selectedCities = {};
  final Map<String, bool> selectedAreas = {
    'Tecnologia': false,
    'Administração': false,
    'Saúde': false,
    'Educação': false,
    'Marketing': false,
  };
  final Map<String, bool> selectedContracts = {
    'Tempo Integral': false,
    'Contrato': false,
    'Terceiro': false,
  };

  @override
  void initState() {
    super.initState();
    for (var city in cities) {
      selectedCities[city] = false;
    }
  }

  void _onCityChanged(bool? newValue, String city) {
    setState(() {
      selectedCities[city] = newValue!;
    });
  }

  void _onAreaChanged(bool? newValue, String area) {
    setState(() {
      selectedAreas[area] = newValue!;
    });
  }

  void _onContractChanged(bool? newValue, String contract) {
    setState(() {
      selectedContracts[contract] = newValue!;
    });
  }

  void _applyFilters() {
    widget.applyFilters(selectedCities, selectedAreas, selectedContracts);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromRGBO(103, 58, 183, 1),
            child: const Text(
              'Filtros',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ExpansionTile(
            title: const Text('Cidade'),
            children: cities.map((city) {
              return CheckboxListTile(
                title: Text(city),
                value: selectedCities[city],
                onChanged: (newValue) {
                  _onCityChanged(newValue, city);
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            title: const Text('Área'),
            children: selectedAreas.keys.map((area) {
              return CheckboxListTile(
                title: Text(area),
                value: selectedAreas[area],
                onChanged: (newValue) {
                  _onAreaChanged(newValue, area);
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            title: const Text('Tipo de Contrato'),
            children: selectedContracts.keys.map((contract) {
              return CheckboxListTile(
                title: Text(contract),
                value: selectedContracts[contract],
                onChanged: (newValue) {
                  _onContractChanged(newValue, contract);
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _applyFilters();
                Navigator.of(context).pop();
              },
              child: const Text('Aplicar Filtros'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
