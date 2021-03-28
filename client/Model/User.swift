//
//  User.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

class User {
    
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
