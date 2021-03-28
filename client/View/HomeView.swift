//
//  HomeView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct HomeView: View {
    
    @EnvironmentObject var session: FirebaseSession
    @EnvironmentObject var network: Network
    @Environment(\.colorScheme) var colorScheme
    
    let coins = "42,069"
    let jobsPosted = 0
    let jobsPending = 2
    let jobsCompleted = 12
    let profile = "profile"
    
    var body: some View {
        NavigationView {
            ZStack {
                signOut
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.lightGreen)
                        VStack {
                            Image(profile)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80.0, height: 80.0, alignment: .center)
                                .clipShape(Circle())
                            Text(network.profile.name)
                                .font(.system(size: 40))
                                .foregroundColor(.darkGreen)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .scaledToFit()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.lightGreen)
                        if !network.lists.isEmpty {
                            ScrollView {
                                LazyVStack {
                                    ForEach(network.lists) { entry in
                                        NavigationLink(
                                            destination: DetailView(task: entry),
                                            label: {
                                                ListEntryView(task:entry)
                                            })
                                    }
                                }
                            }
                        } else {
                            Text("No Current Tasks")
                                .font(.title)
                        }
                        
                    }
                    .padding()
                    .scaledToFit()
                }
                .padding(.top, 40)
            }
            .onAppear {
                network.getProfile()
                network.getAcceptedTasks()
            }
            .navigationTitle(Text("Home"))
        }
    }
    
    var signOut: some View {
        
        VStack {
            HStack {
                Spacer()
                withAnimation {
                    Button(action: {session.logOut()}) {
                        ZStack{
                            Capsule().frame(width: 100, height: 40, alignment: .center)
                                .foregroundColor(.lightGreen)
                            Text("Sign out")
                                .foregroundColor(.darkGreen)
                        }
                    }
                    .padding()
                }
            }
            Spacer()
            
        }
    }
}
        
//
//
//        VStack {
//            withAnimation {
//                Button(action: {session.logOut()}) {
//                    Text("Sign out")
//                }
//            }
//
//            HStack {
//                Image(profile)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 70.0, height: 70.0)
//                    .clipShape(Circle())
//
//                VStack (alignment: .leading) {
//                    Text(name)
//                        .font(.system(size: 40))
//                }
//                .padding(.top)
//                .padding(.trailing)
//            }
//            .scaledToFit()
//            .foregroundColor(.darkGreen)
//
//            VStack {
//                HStack {
//                    Text("Jobs Posted")
//                    Text(String(jobsPosted))
//                }
//                HStack {
//                    Text("Jobs Pending")
//                    Text(String(jobsPending))
//                }
//                HStack {
//                    Text("Jobs Completed")
//                    Text(String(jobsCompleted))
//                }
//            }
//            .font(.system(size: 30))
//            .padding()
//            .border(colorScheme == .dark ? Color.white : Color.black)
//            .padding()
//        }
//    }
        
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            HomeView()
        }
    }
}
