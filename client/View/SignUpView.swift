//
//  SignUpView.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.lightGreen, Color.lightGreen]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
//            .shadow(color: .gray, radius: 10)
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(.midGreen)
                .position(x: UIScreen.main.bounds.size.width, y: 0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(OvalTextFieldStyle())
                    .padding()
                    
                SecureField("Password", text: $password)
                    .textFieldStyle(OvalTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom)
                
                Button(action: signup) {
                        Text("Sign Up")
                            .font(.title)
                            .frame(width: 300)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(Color.darkGreen)
                            )
                            .padding()
                    }
            }
        }
        
        .navigationBarTitle(Text("Sign up"))
        
    }
    
    func signup() {
        self.session.signUp(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error")
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
