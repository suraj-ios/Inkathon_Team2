//
//  RegistrationModel.swift
//  Inkathon
//
//  Created by Suraj on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import Foundation
import SwiftyJSON

class RegistrationModel{
    
    var status : String
    var sessionKey : String
    
    init() {
        self.status = String()
        self.sessionKey = String()
        
    }
    
    convenience init (json : JSON){
        self.init()
        self.status = json["status"].stringValue
        self.sessionKey = json["sessionKey"].stringValue
        
    }
}
