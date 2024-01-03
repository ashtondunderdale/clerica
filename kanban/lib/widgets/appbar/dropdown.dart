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
  String? _dropdownValue = "Your Project Phases";
  ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 40,
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
            items: [
              DropdownMenuItem<String>(
                value: "All Project Phases",
                child: Text("All Project Phases"),
              ),
              DropdownMenuItem<String>(
                value: "Your Project Phases",
                child: Text("Your Project Phases"),
              ),
              DropdownMenuItem<String>(
                value: "Internal Applications",
                child: Text("Internal Applications"),
              ),
            ],
            onChanged: (String? value) async {
              api.clearKanban();
              
              _dropdownValue = value;
              await api.getPhases(_dropdownValue.toString(), "");                 

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
