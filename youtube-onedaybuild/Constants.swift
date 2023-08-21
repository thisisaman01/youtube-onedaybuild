//
//  ConstantsTemplate.swift
//  youtube-onedaybuild
//
//  Created by AMAN K.A on 14/08/23.
//

import Foundation


struct Constants {
static var API_KEY = "AIzaSyBtz673FCnrDrfP_MqSFpl-ZeCF7zPKAF8"
static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
static var API_URL =
    "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}

