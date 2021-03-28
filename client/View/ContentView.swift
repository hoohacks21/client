//
//  ContentView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI
import CoreData
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @ObservedObject var session = FirebaseSession()
    
    
    var body: some View {
    
        Group {
            if session.session != nil {
                withAnimation {
                    TabBarView().environmentObject(session)
                }
            } else {
                withAnimation {
                    CredentialsView().environmentObject(session)
                }
            }
        }
        .onAppear(perform: getUser)
        
        
    }
    
    
    func getUser() {
            session.listen()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
