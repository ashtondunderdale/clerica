import 'package:flutter/material.dart';
import 'package:kanban_application/main.dart';
import 'package:kanban_application/utils/api_service.dart';
import 'package:kanban_application/models/data.dart';

class PhasesDropDownButton extends StatefulWidget {

  PhasesDropDownButton({Key? key}) : super(key: key);

  @override
  State<PhasesDropDownButton> createState() => _PhasesDropDownButtonState();
}

class _PhasesDropDownButtonState extends State<PhasesDropDownButton> {
  String? _dropdownValue = "Internal Applications";
  ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, right: 24),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton<String>(
            value: _dropdownValue,
            items: developmentProjects.map((String project) {
              return DropdownMenuItem<String>(
                value: project,
                child: Text(project),
              );
            }).toList(),
            onChanged: (String? value) async {
              api.clearKanban();
              
              _dropdownValue = value;
              await api.getPhases(_dropdownValue.toString(), _dropdownValue.toString());                 

              setState(() => currentTheme.updateColumns());
            },
            icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).colorScheme.onPrimary),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
            underline: Container(),
          ),
        ),
      ),
    );
  }
}
