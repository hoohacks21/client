//
//  HomeView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var session: FirebaseSession
    @Environment(\.colorScheme) var colorScheme
    
    let coins = "42,069"
    let name = "John Smith"
    let jobsPosted = 0
    let jobsPending = 2
    let jobsCompleted = 12
    let profile = "profile"
    
    var body: some View {
        VStack {
            withAnimation {
                Button(action: {session.logOut()}) {
                    Text("Sign out")
                }
            }
            
            HStack {
                Image(profile)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70.0, height: 70.0)
                    .clipShape(Circle())
                
                VStack (alignment: .leading) {
                    Text(name)
                        .font(.system(size: 40))
                }
                .padding(.top)
                .padding(.trailing)
            }
            .scaledToFit()
            .foregroundColor(.darkGreen)
            
            VStack {
                HStack {
                    Text("Jobs Posted")
                    Text(String(jobsPosted))
                }
                HStack {
                    Text("Jobs Pending")
                    Text(String(jobsPending))
                }
                HStack {
                    Text("Jobs Completed")
                    Text(String(jobsCompleted))
                }
            }
            .font(.system(size: 30))
            .padding()
            .border(colorScheme == .dark ? Color.white : Color.black)
            .padding()
        }
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            HomeView()
        }
    }
}
