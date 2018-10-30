//
//  WebServices.swift
//  Inkathon
//
//  Created by Suraj on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class WebServices{
    
    static let sharedInstance = WebServices()
    var userDefaults = UserDefaults()
    
    //POST Login
    func postUserLogin(email : String?, password:String?, completionHandler: @escaping (_ response: LoginModel?,_ errorMsg:String?) -> ()){
        
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.email.rawValue] = email
        requestParams[ResponseConstants.password.rawValue] = password
        var headers : HTTPHeaders
        if let headerValue = UserDefaults.standard.string(forKey: "") {
            headers = [(ResponseConstants.sessionkey.rawValue) : headerValue]
        }else
        {
            headers = [(ResponseConstants.sessionkey.rawValue) : ""]
        }
        
        Alamofire.request(WS_POST_LOGIN,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ,headers:headers).responseJSON {response in
            
            if let body = response.result.value {
                let json = JSON(body)
                let responseBody = LoginModel.init(json: json)
                let status = responseBody.status
                print(responseBody)
                if status == ResponseConstants.status.rawValue {
                    completionHandler(responseBody, nil)
                }else{
                    completionHandler(responseBody, nil)
                }
            }else{
                completionHandler(nil, "Please enter valid credentials")
            }
        }
    }
    
    //POST SignUp
    func postSignUp(name:String,email:String,password:String,confirmPassword:String, completionHandler: @escaping (_ response: RegistrationModel?,_ errorMsg:String?) -> ()){
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.name.rawValue] = name
        requestParams[ResponseConstants.password.rawValue] = password
        requestParams[ResponseConstants.email.rawValue] = email
        requestParams[ResponseConstants.passwordConfirmation.rawValue] = confirmPassword
        
        Alamofire.request(WS_POST_REGISTRATION, method: .post, parameters: requestParams, encoding: JSONEncoding.default)
            .validate().responseJSON { (response) in
                
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = RegistrationModel.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        self.userDefaults.set(responseBody.sessionKey, forKey: "authKey")
                        
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
        }
    }
    
    //Get Homefeed
    func getHomeFeed(completionHandler: @escaping (_ response: ListProduct?,_ errorMsg:String?) -> ()){
        Alamofire.request(WS_GET_HOMEPAGE,method: .get ,parameters : nil,encoding: URLEncoding.default ,headers:nil).responseJSON {response in
            if let body = response.result.value {
                let json = JSON(body)
                let responseBody = ListProduct.init(json: json)
                let status = responseBody.data
                completionHandler(responseBody, nil)
                
            }else{
                completionHandler(nil, "Please enter valid credentials")
            }
        }
    }
    
    
}
