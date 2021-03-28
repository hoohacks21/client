//
//  Profile.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import Foundation

class Profile: Codable {
    
    init(id: String, name: String, coins: Int, organization: Bool) {
        self.id = id
        self.name = name
        self.coins = coins
        self.organization = organization
    }
    
    var id: String
    var name: String
    var coins: Int
    var organization: Bool
}
