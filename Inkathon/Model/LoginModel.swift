//
//  LoginModel.swift
//  Inkathon
//
//  Created by Suraj on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginModel{
    
    var status : String
    
    init() {
        self.status = String()
        
    }
    
    convenience init (json : JSON){
        self.init()
        self.status = json["status"].stringValue
    }
    
}
