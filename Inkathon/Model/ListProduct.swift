//
//  ListProduct.swift
//  Inkathon
//
//  Created by Suraj on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListProduct{
    
    var data:[ListProductData]
    
    init() {
        self.data = []
        
    }
    convenience init (json : JSON){
        self.init()
        self.data = JSONArrayFormatter().formatHomeList(json: json["products"])
    }
    
}
