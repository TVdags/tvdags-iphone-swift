//
//  TVEPGNowViewModel.swift
//  tvdags3
//
//  Created by Henrik Wrangel on 2014-07-09.
//  Copyright (c) 2014 TVdagsse AB. All rights reserved.
//

class TVEPGNowViewModel: RVMViewModel {

    var reload: RACCommand?

    init() {
        super.init()
        
        self._setupCommands()
        
        if let reloadCommand = reload {
            reloadCommand.execute(nil)
        }

    }
    
    func _setupCommands() {
        
        self.reload = RACCommand(signalBlock: { (input) -> RACSignal in
            return TVEPGManager.sharedInstance.getShortList("", channels: "", count: 3)
        })
    }
}
