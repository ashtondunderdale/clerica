import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kanban_application/models/data.dart';
import 'package:kanban_application/models/kanban_card.dart';

class ApiService with ChangeNotifier{
  
  void clearKanban(){
    for (int i = 0; i < kanbanData.length; i++){
      kanbanData[i].cards.clear(); // < / <=
    }
  }

  void updateColumns() => notifyListeners();

  Future<bool> getPhases(String dropdownValue, String user) async {

    String apiUrl = ''; // default

    if (dropdownValue == "All Project Phases")
    {
      apiUrl = 'https://localhost:7190/api/v1/ProjectManagementSvc/Epicor/BaqSvcGetProjectPhases';
    }
    else if (dropdownValue == "Specific User Project Phases")
    { 
      apiUrl = 'https://localhost:7190/api/v1/ProjectManagementSvc/Epicor/BaqSvcGetProjectPhasesForSpecificUser';
    }

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    Map<String, dynamic> requestBody = {
      "User": user,
    };

    int noStatusCardCount = 0;

    try {
      http.Response response = await http.post(Uri.parse(apiUrl), 
        headers: header, 
        body: jsonEncode(requestBody)
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final parsedData = jsonDecode(json);
        
        List<dynamic> projects = parsedData['value'];

        for (var project in projects) {
          KanbanCard card = KanbanCard(
            parentPhase: project['ProjPhase_Description']   ?? "NULL",
            summary:     project['ProjPhase_Description']   ?? "No Summary",
            status:      project['UD04Status_Character01']  ?? 'No Status',
            comments:    project['ProjPhase_Comments_c']    ?? "",
            sprint:      project['UD02_Character01']        ?? "Unassigned Sprint",
            project:     project['Project_Description']     ?? "NULL",
            assignedTo:  project["EmpBasic1_Name"]          ?? "??",
            ownedBy:     project["EmpBasic_Name"]           ?? "??",
            storyPoints: project["ProjPhase_StoryPoints_c"] ?? "??",
          );          
          switch (card.status)
          {
            case "Backlog" || "Fail Test": kanbanData[0].cards.add(card); // goes to BACKLOG                 

            case "In Development" || "In development" || "With Torchbearer": kanbanData[1].cards.add(card); // goes to DEVELOPING                     

            case "Developed": kanbanData[2].cards.add(card); // goes to DEVELOPED                      

            case "UAT" || "UAT 10.2.600" || "UAT 10.2.700" || "UAT Kinetic" || "Staging" : kanbanData[3].cards.add(card); // goes to TESTING                    

            case "Pass Test": kanbanData[4].cards.add(card); // goes to TESTED                    

            case "Complete" || "Ready For Release" || "Ready for Release" || "Released": kanbanData[5].cards.add(card); // goes to DONE             

            default: 
            if (card.status == "No Status")
            {
              noStatusCardCount++;
            }
            else
            {
              print("Invalid status for card: ${card.status}");
            }

            /** Status not accounted for:
             * 
             *  Requirements
             *  Quote
             *  On Hold
             *  Reject
             *  Closed    
             */

            notifyListeners();
          }
        }
        print("\n$noStatusCardCount items found with No Status");
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