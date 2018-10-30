//
//  ListProductData.swift
//  Inkathon
//
//  Created by Suraj on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListProductData{
    
    var prodcutId:String
    var name:String
    var details:String
    var cost:String
    var image:String
    var barcode:String
    
    
    init() {
        self.prodcutId = String()
        self.name = String()
        self.details = String()
        self.cost = String()
        self.image = String()
        self.barcode = String()
    }
    
    convenience init (json : JSON){
        self.init()
        self.prodcutId = json["prodcutId"].stringValue
        self.name = json["name"].stringValue
        self.details = json["details"].stringValue
        self.cost = json["cost"].stringValue
        self.image = json["image"].stringValue
        self.barcode = json["barcode"].stringValue
        
    }
    
}
