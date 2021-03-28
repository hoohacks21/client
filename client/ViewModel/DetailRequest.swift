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
    @Published var users: [Task] = []
    
    func getTasks() {
        Auth.auth().currentUser!.getIDToken(completion: { (res, err) in
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
                
                URLSession.shared.dataTask(with: request) { data, error, result in
                    DispatchQueue.main.async {
                        do {
                            print(data!)
                            let decodedUsers = try JSONDecoder().decode([Task].self, from: data!)
                            self.users = decodedUsers
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                        
                    }
                }.resume()
            }
        })
    }
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




extension URLSession {
    func dataTask(with url: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
    return dataTask(with: url) { (data, response, error) in
        if let error = error {
            result(.failure(error))
            return
        }
        guard let response = response, let data = data else {
            let error = NSError(domain: "error", code: 0, userInfo: nil)
            result(.failure(error))
            return
        }
        result(.success((response, data)))
    }
}
}




public enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
