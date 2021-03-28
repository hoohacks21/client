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
            if network.lists.isEmpty {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 200, alignment: .center)
                        .foregroundColor(.lightGreen)
                    HStack {
                        Spacer()
                        Text("We've run out of tasks!")
                            .font(.title)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                .navigationTitle(Text("Tasks"))
            } else {
                ScrollView {
                    LazyVStack(alignment: .center) {
                        Section {
                            ForEach(network.lists) { entry in
                                ListEntryView(task: entry)
                            }
                        }
                    }
                }
                .padding(.top)
                .navigationTitle(Text("Tasks"))
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

