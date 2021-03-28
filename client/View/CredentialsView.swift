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
                Text("Ecochain")
                    .bold()
                    .font(.system(size: 60))
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.darkGreen)
                    
                Image("tree")
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
