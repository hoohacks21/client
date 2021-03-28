//
//  LogInView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI
import UIKit

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        VStack {
            
            
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(OvalTextFieldStyle())
                .padding()
                
            SecureField("Password", text: $password)
                .textFieldStyle(OvalTextFieldStyle())
                .padding()
            
            Button(action: login) {
                    Text("Log in")
                        .font(.title)
                        .frame(width: 300)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .background(
                            Capsule()
                                .fill(Color.darkGreen)
                        )
                        .padding()
                        .shadow(radius: 10)
                }
        }
        .navigationBarTitle(Text("Login"))
        
    }
    
    func login() {
        self.session.logIn(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error")
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
