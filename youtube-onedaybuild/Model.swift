//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by AMAN K.A on 12/08/23.
//

import Foundation



class Model {
    
    func getVideos()  {
        
        // create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // Get a URL session object
        
        let   session = URLSession.shared
        
        // get a data task from the URLSession object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error)
             in
            
            
            // check if there were any errors
            
            if error != nil || data == nil {
                return
            }
            
            // parsing the data into video objects
        }
        
        // kick off the task
       
        dataTask.resume()
    }
}
