//
//  CreateTaskView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-28.
//

import SwiftUI

struct CreateTaskView: View {
    
    @State private var id: Int = 0
    @State private var created_by: String = ""
    @State private var date_to_complete: Date = Date()
    @State private var task_type: String = ""
    @State private var time_to_complete: Int = 0
    @State private var location: String = ""
    @State private var lat: String = ""
    @State private var long: String = ""
    @State private var reward: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            
            Section(header: Text("Details")) {
                TextField("Activity Name", text: $task_type)
                TextField("Activity Description", text: $description)
            }
            
            Section(header: Text("Date")) {
                DatePicker("Select Date", selection: $date_to_complete)
            }
            
            Section(header: Text("Location")) {
                TextField("Location Name", text: $location)
                TextField("Location Latitude", text: $lat)
                TextField("Location Longitude", text: $long)
            }
            
            Section(header: Text("Coins")) {
                TextField("Monetary Reward", text: $reward)
            }
            
            Section(header: Text("submit")) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Submit Task")
                })
            }
            
        }
    }
}

//struct CreateTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTaskView()
//    }
//}




//
//var id: Int
//var created_by: String
//var date_to_complete: String
//var task_type: String
//var time_to_complete: Int
//var location: String
//var lat: Float64
//var long: Float64
//var reward: Int
//var description: String
