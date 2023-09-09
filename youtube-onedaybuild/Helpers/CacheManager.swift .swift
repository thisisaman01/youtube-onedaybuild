//
//  CacheManager.swift .swift
//  youtube-onedaybuild
//
//  Created by AMAN K.A on 27/08/23.
//

import Foundation


class CacheManager  {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        //store the image data and url as the key
        
        cache[url] = data
    }
    static func getVideoCache(_ url:String)  -> Data? {
        
        // try to get the data for the specified url
        return cache[url]
    }

}

