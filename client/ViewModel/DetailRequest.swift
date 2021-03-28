//
//  DetailRequest.swift
//  client
//
//  Created by Ari Dokmecian on 2021-03-27.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class Network: ObservableObject {
    
    @Published var lists: [Task] = []
    @Published var profile: Profile = Profile(id: "", name: "", coins: 0, organization: false)
    @Published var acceptedTasks: [Task] = []
    
    func getAcceptedTasks() {
        Auth.auth().currentUser!.getIDToken(completion: { (res, err) in
            if err != nil {
                print(err!)
            } else {
                guard let url = URL(string: ProcessInfo.processInfo.environment["serverUrl"]! + "my_tasks") else {
                    print("Invalid URL")
                    return
                }

                print(res!)
                
                var request = URLRequest(url: url)
                request.addValue("Bearer " + res!, forHTTPHeaderField: "Authorization")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpMethod = "GET"
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let error = error {
                        print("Request error: ", error)
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else { return }
                    
                    if response.statusCode == 200 {
                        guard let data = data else { return }
                    
                        DispatchQueue.main.async {
                            do {
                                let myTasks = try JSONDecoder().decode([Task].self, from: data)
                                self.acceptedTasks = myTasks
                            } catch let error {
                                print("Error decoding: ", error)
                            }
                        }
                    }
                }.resume()
            }
        })
    }
    
    func acceptTask(uid: Int) {
        Auth.auth().currentUser!.getIDToken(completion: { (res, err) in
            if err != nil {
                print(err!)
            } else {
                guard let url = URL(string: ProcessInfo.processInfo.environment["serverUrl"]! + "accept_task") else {
                    print("Invalid URL")
                    return
                }

                print(res!)
                
                var request = URLRequest(url: url)
                request.addValue("Bearer " + res!, forHTTPHeaderField: "Authorization")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try! JSONEncoder().encode(["uid": uid])
                request.httpMethod = "POST"
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let error = error {
                        print("Request error: ", error)
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else { return }
                    
                    if response.statusCode == 200 {
                        DispatchQueue.main.async {
                           self.getTasks()
                        }
                    }
                }.resume()
            }
        })
    }
    
    func getTasks() {
        Auth.auth().currentUser?.getIDToken(completion: { (res, err) in
            if err != nil {
                print(err!)
            } else {
                guard let url = URL(string: ProcessInfo.processInfo.environment["serverUrl"]! + "tasks") else {
                    print("Invalid URL")
                    return
                }

                print(res!)
                
                var request = URLRequest(url: url)
                request.addValue("Bearer " + res!, forHTTPHeaderField: "Authorization")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpMethod = "GET"
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let error = error {
                        print("Request error: ", error)
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else { return }
                    
                    if response.statusCode == 200 {
                        guard let data = data else { return }
                
                        DispatchQueue.main.async {
                            do {
                                let decodedTasks = try JSONDecoder().decode([Task].self, from: data)
                                self.lists = decodedTasks
                            } catch let error {
                                print("Error decoding: ", error)
                            }
                        }
                    }
                }.resume()
            }
        })
    }
    
    
    func getProfile() {
        Auth.auth().currentUser!.getIDToken(completion: { (res, err) in
            if err != nil {
                print(err!)
            } else {
                guard let url = URL(string: ProcessInfo.processInfo.environment["serverUrl"]! + "profile") else {
                    print("Invalid URL")
                    return
                }

                print(res!)
                
                var request = URLRequest(url: url)
                request.addValue("Bearer " + res!, forHTTPHeaderField: "Authorization")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpMethod = "GET"
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Request error: ", error)
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else { return }
                    
                    if response.statusCode == 200 {
                        guard let data = data else { return }
                
                        DispatchQueue.main.async {
                            do {
                                let decodeProfile = try JSONDecoder().decode(Profile.self, from: data)
                                self.profile = decodeProfile
                            } catch let error {
                                print("Error decoding: ", error)
                            }
                        }
                    }
                }.resume()
            }
        })
    }
        func configProfile(profile: Profile) {
            Auth.auth().currentUser!.getIDToken(completion: { (res, err) in
                if err != nil {
                    print(err!)
                } else {
                    guard let url = URL(string: ProcessInfo.processInfo.environment["serverUrl"]! + "profile") else {
                        print("Invalid URL")
                        return
                    }

                    print(res!)
                    
                    var request = URLRequest(url: url)
                    request.addValue("Bearer " + res!, forHTTPHeaderField: "Authorization")
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpBody = try! JSONEncoder().encode(profile)
                    request.httpMethod = "PUT"
                    
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        // handle the result here.
                    }.resume()
                }
            })
        }

}
