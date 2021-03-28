//
//  Task.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-28.
//

import Foundation

class Task: Codable, Identifiable {
    
    init(id: Int, CreatedBy: String, date_to_complete: String,task_type: String,time_to_complete: Int, location: String, lat: Float64, long: Float64, reward: Int, description: String) {
        self.id = id
        self.created_by = CreatedBy
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SS+TIME:ZONE"
        self.date_to_complete = date_to_complete
        self.task_type = task_type
        self.time_to_complete = time_to_complete
        self.location = location
        self.lat = lat
        self.long = long
        self.reward = reward
        self.description = description
    }
    
    
    var id: Int
    var created_by: String
    var date_to_complete: String
    var task_type: String
    var time_to_complete: Int
    var location: String
    var lat: Float64
    var long: Float64
    var reward: Int
    var description: String
}
