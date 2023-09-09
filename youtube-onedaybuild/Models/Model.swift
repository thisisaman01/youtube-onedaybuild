//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by AMAN K.A on 12/08/23.
//

import Foundation

// Protocol to be adopted by the delegate
protocol ModelDelegate {
    func videosFetched(_ videos: [Video]) // Add a closing parenthesis here
}

class Model {
    
    var delegate: ModelDelegate // Add ': ModelDelegate' to specify protocol conformance
    
    init(delegate: ModelDelegate) { // Add an initializer to set the delegate
        self.delegate = delegate
    }
    
    func getVideos()  {
        
        // Create a URL object
        if let url = URL(string: Constants.API_URL) {
            
            // Get a URL session object
            let session = URLSession.shared
            
            // Get a data task from the URLSession object
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                // Check if there were any errors
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    // Parsing the data into video objects
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let response = try decoder.decode(Response.self, from: data)
                    
                    if let items = response.items {
                        
                        DispatchQueue.main.async {
                            // Call the "videosFetched" method of the Delegate
                            self.delegate.videosFetched(items)
                        }
                       
                    }
                    
                   // dump(response)
                }
                catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            
            // Kick off the task
            dataTask.resume()
        } else {
            print("Invalid URL")
        }
    }
}
 
