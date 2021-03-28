//
//  ListEntryView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-28.
//

import SwiftUI

struct ListEntryView: View {
    
    var task: Task

    var body: some View {
        NavigationLink(
            destination: DetailView(task: task),
            label: {
                boxEntry
            })
    }
    
    var boxEntry: some View {
        GroupBox(label:
            HStack {
                Text(task.task_type + " - " + task.location).scaledToFit().scaledToFit()
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(Color(.systemGray4)).imageScale(.small)
            },
            content: {
                VStack {
                    HStack {
                        Text("Coins - ")
                        Text(String(task.reward))
                        Spacer()
                    }
                    HStack {
                        Text(task.description).scaledToFit()
                        Spacer()
                    }
                }
            })
            .padding(.horizontal)
    }
}

struct ListEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListEntryView(task: Task(id: 143334341, CreatedBy: "a", date_to_complete: "a", task_type: "APPLE", time_to_complete: 10, location: "york", lat: 1.345353, long: 1.353545, reward: 100, description: "wow"))
        }
    }
}
