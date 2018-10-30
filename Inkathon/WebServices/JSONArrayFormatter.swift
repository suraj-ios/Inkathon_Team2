//
//  JSONArrayFormatter.swift
//  Inkathon
//
//  Created by Suraj on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONArrayFormatter{
    
    func formatHomeList(json: JSON) -> [ListProductData] {
        var responseArray: [ListProductData] = []
        for i in 0..<json.count {
            responseArray.append(ListProductData(json: json[i]))
        }
        return responseArray
    }
    
}
