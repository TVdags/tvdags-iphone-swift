//
//  TVEPGManager.swift
//  tvdags3
//
//  Created by Henrik Wrangel on 2014-07-08.
//  Copyright (c) 2014 TVdagsse AB. All rights reserved.
//

class TVEPGManager: NSObject {
    
    // Singleton setup
    class var sharedInstance: TVEPGManager {
    struct Static {
        static var instance: TVEPGManager?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = TVEPGManager()
        }
        
        return Static.instance!
    }
    
    func getShortList(startdate: String!, channels: String!, count: Int) -> RACSignal {
        
        return RACSignal.createSignal( { (subscriber) -> RACDisposable in
            
            let op = TVAPIClient.sharedInstance.GET("v1/api/epg/getTimelineList/2014-07-08/1",
                parameters: nil,
                success: { (operation: NSURLSessionDataTask!, responseObject: AnyObject!) in
                    println("JSON: " + responseObject.description)
                    subscriber.sendNext(responseObject)
                    subscriber.sendCompleted()
                },
                failure: { (operation: NSURLSessionDataTask!, error: NSError!) in
                    println("Error : " + error.localizedDescription)
                    println ("operation: " + operation.description)
                    subscriber.sendError(error)
                }
            )
            
            return RACDisposable(block: {
                op.cancel()
                })
        }).replayLazily()
    }
}
