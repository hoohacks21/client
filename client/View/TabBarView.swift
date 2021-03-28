//
//  TabBarView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI

struct TabBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        withAnimation {
            TabView {
                HomeView()
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house.circle.fill")
                    }
                TaskListView()
                    .accentColor(colorScheme == .dark ? Color.white : Color.black)
                    .tabItem {
                        Text("Tasks")
                        Image(systemName: "checkmark.circle.fill")
                    }
                CreateTaskView()
                    .tabItem {
                        Text("Post")
                        Image(systemName: "paperplane.circle.fill")
                    }
                Text("Verify")
                    .tabItem {
                        Text("Verify")
                        Image(systemName: "checkmark.seal.fill")
                    }
            }.accentColor(.midGreen)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
