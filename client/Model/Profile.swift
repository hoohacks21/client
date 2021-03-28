//
//  Profile.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import Foundation

class Profile: Codable {
    
    init(ID: String, Name: String, Coins: Int, Organization: Bool) {
        self.ID = ID
        self.Name = Name
        self.Coins = Coins
        self.Organization = Organization
    }
    
    var ID: String
    var Name: String
    var Coins: Int
    var Organization: Bool
}
