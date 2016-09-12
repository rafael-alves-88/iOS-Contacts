//
//  SyncServer.swift
//  Contacts
//
//  Created by Usuário Convidado on 04/02/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import Foundation

protocol SyncServerDelegate: class {
    func infoSaved()
}

class SyncServer: NSObject {
    weak var delegate: SyncServerDelegate?
    
    init (delegate:SyncServerDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func saveinfo() {
        let timer = NSTimer.scheduledTimerWithTimeInterval(3,
                    target: self, selector: #selector(SyncServer.finished),
                    userInfo: nil,
                    repeats: false)
    }
    
    func finished() {
        self.delegate?.infoSaved()
    }
}