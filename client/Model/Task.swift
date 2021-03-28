//
//  Task.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-28.
//

import Foundation

class Task: Codable, Identifiable {
    
    init(ID: Int, CretedBy: String, DateToComplete: String,TaskType: String,TimeToComplete: Int, Location: String, Lat: Float64, Long: Float64, Reward: Int, Desciption: String, Status: Int) {
        self.ID = ID
        self.CretedBy = CretedBy
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SS+TIME:ZONE"
        self.DateToComplete = dateFormatter.date(from: DateToComplete)!
        self.TaskType = TaskType
        self.TimeToComplete = TimeToComplete
        self.Location = Location
        self.Lat = Lat
        self.Long = Long
        self.Reward = Reward
        self.Desciption = Desciption
    }
    
    
    var ID: Int
    var CretedBy: String
    var DateToComplete: Date
    var TaskType: String
    var TimeToComplete: Int
    var Location: String
    var Lat: Float64
    var Long: Float64
    var Reward: Int
    var Desciption: String
}
