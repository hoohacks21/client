//
//  FirebaseSession.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import SwiftUI
import Firebase
import FirebaseAuth

class FirebaseSession: ObservableObject {
    
    //MARK: Properties
    @Published var session: User?
    @Published var isLoggedIn: Bool?
    
    //MARK: Functions
    func listen() {
        Auth.auth().currentUser?.getIDToken(completion: { (res, err) in
            print(res!)
        })
        
        
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
        }
    }
    
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func logOut() {
            try! Auth.auth().signOut()
            self.isLoggedIn = false
            self.session = nil
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
}
