//
//  Message.swift
//  ChatApp
//
//  Created by Mark Stephenson on 23/02/2017.
//  Copyright © 2017 Mark Stephenson. All rights reserved.
//

import UIKit

struct Message {
    var content: String?
    var from: String?
    
    init(content: String?, from: String?){
        self.content = content
        self.from = from
    }
}
