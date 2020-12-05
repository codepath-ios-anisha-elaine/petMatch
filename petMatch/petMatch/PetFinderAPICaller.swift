//
//  PetFinderAPICaller.swift
//  petMatch
//
//  Created by Elaine Duh on 12/4/20.
//

import Foundation

struct PetFinderAPICaller {
    static func getPetTypes(completion: @escaping ([[String:Any]]?) -> Void) {
        // Get from API
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
                keys = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = keys {
            let apikey = dict["bearerToken"] as! String
            let url = URL(string: "https://api.petfinder.com/v2/types")!
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            
            // Insert API Key to request
            request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
            print("get pet type api call")
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                // This will run when the network request returns
                if let error = error {
                    print("get pet type api call error")
                    print(error.localizedDescription)
                } else if let data = data {
                    print("get pet type api call no error")
                    // ––––– TODO: Get data from API and return it using completion
                    // 1. Convert json response to a dictionary
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    // 2. Grab pet types data and convert it to an array of dictionaries
                    // for each restaurant
                    let petTypes = dataDictionary["types"] as! [[String: Any]]
                    // 3. Completion is an excaping method which allows the data to be used
                    // outside of the closure
                    return completion(petTypes)
                }
            }
            task.resume()
        }
    }
    
    static func getPetBreeds(breedURLPath: String, completion: @escaping ([[String:Any]]?) -> Void) {
        // Get from API
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
                keys = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = keys {
            let apikey = dict["bearerToken"] as! String
            let url = URL(string: "https://api.petfinder.com\(breedURLPath)")!
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            
            // Insert API Key to request
            request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
            print("get pet breed api call")
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                // This will run when the network request returns
                if let error = error {
                    print("get pet breed api call error")
                    print(error.localizedDescription)
                } else if let data = data {
                    print("get pet breed api call no error")
                    // ––––– TODO: Get data from API and return it using completion
                    // 1. Convert json response to a dictionary
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    // 2. Grab pet types data and convert it to an array of dictionaries
                    // for each restaurant
                    let petBreeds = dataDictionary["breeds"] as! [[String: Any]]
                    // 3. Completion is an excaping method which allows the data to be used
                    // outside of the closure
                    return completion(petBreeds)
                }
            }
            task.resume()
        }
    }
    
    static func getPetResults(petType: String,
                                 petBreed: String,
                                 petSize: String,
                                 petGender: String,
                                 petAge: String,
                                 petColor: String,
                                 petLocation: String,
                                 petDistance: Int,
                                 completion: @escaping ([[String:Any]]?) -> Void) {
        // Get from API
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
                keys = NSDictionary(contentsOfFile: path)
        }
        print("getting pet results")
        if let dict = keys {
            let apikey = dict["bearerToken"] as! String
            let urlString = "https://api.petfinder.com/v2/animals?type=\(petType)&size=\(petSize)&gender=\(petGender)&age=\(petAge)&color=\(petColor)&location=\(petLocation)&distance=\(petDistance)"
            let url = URL(string: urlString)!
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            
            // Insert API Key to request
            request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
            print("get pet matches api call")
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                print("get pet matches api call?")
                
                // This will run when the network request returns
                if let error = error {
                    print("get pet matches api call error")
                    print(error.localizedDescription)
                } else if let data = data {
                    print("get pet matches api call no error")
                    // ––––– TODO: Get data from API and return it using completion
                    // 1. Convert json response to a dictionary
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    // 2. Grab animals data and convert it to an array of dictionaries
                    // for each animal
                    let petResults = dataDictionary["animals"] as! [[String: Any]]
                    // 3. Completion is an excaping method which allows the data to be used
                    // outside of the closure
                    return completion(petResults)
                }
            }
            task.resume()
        }
    }
}
