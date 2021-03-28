//
//  DetailView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-28.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var network: Network
    
    var task: Task
    
    var body: some View {
        Form {
            
            Section(header: Text("Type and location")) {
                HStack {
                    Text(task.task_type)
                    Text(" - ")
                    Text(task.location)
                }
            }
                       
            Section(header: Text("Description")) {
                Text(task.description)
            }
            
            Section(header: Text("Rewards")) {
                HStack {
                    Text(String(task.reward))
                    Image(systemName: "dollarsign.circle.fill")
                }
            }
            
            Button(action: acceptTask, label: {
                Text("Accept Task")
            })
                       
        }
        .navigationTitle(Text(task.task_type))
    }
    
    
    func acceptTask() {
        print(task.id)
        network.acceptTask(uid: task.id)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(task: Task(id: 143334341, CreatedBy: "a", date_to_complete: "a", task_type: "APPLE", time_to_complete: 10, location: "york", lat: 1.345353, long: 1.353545, reward: 100, description: "wow"))
        }
    }
}
