//
//  TaskListView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-28.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var network: Network
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .center) {
                    Section {
                        ForEach(network.lists) { entry in
                            ListEntryView(task: entry)
                        }
                    }
                }
            }.navigationTitle(Text("Tasks"))
        }
        
        .onAppear {
            network.getTasks()
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
