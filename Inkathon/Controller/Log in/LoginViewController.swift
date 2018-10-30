//
//  LoginViewController.swift
//  Inkathon
//
//  Created by Suraj on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController:UIViewController{
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    var appd:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        
        self.loginButton.layer.cornerRadius = 15
        
    }
    
    override func viewDidLayoutSubviews() {
        
        var border = CALayer()
        var width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: userNameTextField.frame.size.height - width, width: userNameTextField.frame.size.width, height: userNameTextField.frame.size.height)
        border.borderWidth = width
        userNameTextField.backgroundColor = UIColor.clear
        userNameTextField.layer.addSublayer(border)
        userNameTextField.layer.masksToBounds = true
        userNameTextField.textColor = UIColor.white
        
        var borders = CALayer()
        var widths = CGFloat(1.0)
        borders.borderColor = UIColor.white.cgColor
        borders.frame = CGRect(x: 0, y: passwordTextField.frame.size.height - width, width: passwordTextField.frame.size.width, height: passwordTextField.frame.size.height)
        borders.borderWidth = widths
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.layer.addSublayer(borders)
        passwordTextField.layer.masksToBounds = true
        passwordTextField.textColor = UIColor.white
        
        userNameTextField.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "user")
        imageView.image = image
        userNameTextField.leftView = imageView
        
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        let imageViews = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let images = UIImage(named: "password")
        imageViews.image = images
        passwordTextField.leftView = imageViews
        
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    
    @IBAction func loginPageFunc(_ sender: Any) {
        if (self.userNameTextField.text?.isEmpty)!{
            self.shakeView(self.userNameTextField)
        }
        else if (self.passwordTextField.text?.isEmpty)!{
            shakeView(passwordTextField)
        }
        else if self.isValidEmail(testStr: self.userNameTextField.text!) == false{
            self.shakeView(self.userNameTextField)
        }
        else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destination = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let navBar = UINavigationController(rootViewController: destination)
           // self.present(navBar, animated: true, completion: nil)
            
            let rootController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabbarControllerr")
            
            self.appd.window?.rootViewController = rootController
            
        }
        
    }
    
    @IBAction func registrationPageFunc(_ sender: Any) {
        //Call the API wit validation
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.present(destination, animated: true, completion: nil)
        
        
    }
    
    // updated code for swift 3
    func shakeView(_ sender:UITextField){
        
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        let from_point:CGPoint = CGPoint(x:sender.center.x - 5, y:sender.center.y)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        let to_point:CGPoint = CGPoint(x:sender.center.x + 5, y:sender.center.y)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        shake.fromValue = from_value
        shake.toValue = to_value
        sender.layer.add(shake, forKey: "position")

    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
