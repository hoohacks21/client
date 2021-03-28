//
//  CredentialsView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI

struct CredentialsView: View {
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        NavigationView {
            VStack {
                Text("App Name")
                    .bold()
                    .font(.system(size: 60))
                    .aspectRatio(contentMode: .fit)
                    
                Image("credentialsImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                NavigationLink(destination: LogInView()){
                        Text("Log in")
                            .font(.title)
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(Color.darkGreen)
                            )
                            .padding()
                            .shadow(radius: 10)
                            
                    }
                
                NavigationLink(
                    destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.title)
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .background(
                            Capsule()
                                .fill(Color.darkGreen)
                        )
                        .padding(.bottom)
                        .padding(.leading)
                        .padding(.trailing)
                        .shadow(radius: 10)
                }
            }
        }
    }
}

struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView()
    }
}
