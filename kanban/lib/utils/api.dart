  import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kanban_application/utils/data.dart';
import 'package:kanban_application/widgets/kanban_card.dart';

class ApiService{

  Future<bool> getPhases(String dropdownValue) async {

    //kanbanData.clear();

    String apiUrl = 'https://localhost:7190/api/v1/ProjectManagementSvc/Epicor/BaqSvcGetProjectPhasesForCurrentUser'; // default

    if (dropdownValue == "All Project Phases")
    {
      apiUrl = 'https://localhost:7190/api/v1/ProjectManagementSvc/Epicor/BaqSvcGetProjectPhases';
    }
    else if (dropdownValue == "Your Project Phases")
    {
      apiUrl = 'https://localhost:7190/api/v1/ProjectManagementSvc/Epicor/BaqSvcGetProjectPhasesForCurrentUser';
    }
    else if (dropdownValue == "Specific User Project Phases")
    {
      apiUrl = 'https://localhost:7190/api/v1/ProjectManagementSvc/Epicor/BaqSvcGetProjectPhasesForSpecificUser';
    }

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.post(Uri.parse(apiUrl), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final parsedData = jsonDecode(json);
        
        List<dynamic> projects = parsedData['value'];

        for (var project in projects) {
          KanbanCard card = KanbanCard(
            summary:  project['ProjPhase_Description']  ?? "Null",
            status:   project['UD04Status_Character01'] ?? 'Ignored',
            comments: project['ProjPhase_Comments_c']   ?? "Null",
            sprint:   project['UD02_Character01']       ?? "Null",
            project:  project['Project_Description']    ?? "Null",
          );
          
          switch (card.status)
          {
            case "Backlog":
                kanbanData[0].cards.add(card);                     

            case "In Development":
                kanbanData[1].cards.add(card);                     

            case "Developed":
                kanbanData[2].cards.add(card);                     

            case "In Test":
                kanbanData[3].cards.add(card);                     

            case "Tested":
                kanbanData[4].cards.add(card);                     

            case "Done":
                kanbanData[5].cards.add(card);                     

            default:
              print("Null Property (status) for card: ${card.summary}");
          }
        }
        return true;
      } 
      else 
      {
        print('Error: ${response.statusCode}');
        return false;
      }
    } 
    catch (e) 
    {
      print("Exception Error: $e");
      return false;
    }
  }
}