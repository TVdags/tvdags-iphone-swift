//
//  TVAPIClient.swift
//  tvdags3
//
//  Created by Henrik Wrangel on 2014-07-08.
//  Copyright (c) 2014 TVdagsse AB. All rights reserved.
//

import Foundation

class TVAPIClient: AFHTTPSessionManager {
    
    // Singleton setup
    class var sharedInstance: TVAPIClient {
    struct Static {
        static var instance: TVAPIClient?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = TVAPIClient(baseURL: NSURL.URLWithString("http://api2.tvdags.se"))
        }
        
        return Static.instance!
    }
    
    init(baseURL url: NSURL!) {
        super.init(baseURL: url, sessionConfiguration: nil)
        
        self.responseSerializer = AFJSONResponseSerializer()
        self.requestSerializer = AFJSONRequestSerializer()
    }
}