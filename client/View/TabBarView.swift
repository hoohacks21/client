//
//  TabBarView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI

struct TabBarView: View {
    
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.circle.fill")
                }
            Text("Tasks")
                .tabItem {
                    Text("Tasks")
                    Image(systemName: "checkmark.circle.fill")
                }
            Text("Post")
                .tabItem {
                    Text("Post")
                    Image(systemName: "paperplane.circle.fill")
                }
            Text("Verify")
                .tabItem {
                    Text("Verify")
                    Image(systemName: "checkmark.seal.fill")
                }
        }
        .accentColor(.green)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
