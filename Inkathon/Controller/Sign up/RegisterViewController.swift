//
//  RegisterViewController.swift
//  Inkathon
//
//  Created by nareshnaidu on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var addrssTextFeild: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.signUpButton.layer.cornerRadius = 15
        
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
        
        userNameTextField.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "user")
        imageView.image = image
        userNameTextField.leftView = imageView
        
        var border1 = CALayer()
        var width1 = CGFloat(1.0)
        border1.borderColor = UIColor.white.cgColor
        border1.frame = CGRect(x: 0, y: emailTextField.frame.size.height - width1, width: emailTextField.frame.size.width, height: emailTextField.frame.size.height)
        border1.borderWidth = width1
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.layer.addSublayer(border1)
        emailTextField.layer.masksToBounds = true
        emailTextField.textColor = UIColor.white
        
        emailTextField.leftViewMode = UITextField.ViewMode.always
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image2 = UIImage(named: "email")
        imageView2.image = image2
        emailTextField.leftView = imageView2
        
        var border2 = CALayer()
        var width2 = CGFloat(1.0)
        border2.borderColor = UIColor.white.cgColor
        border2.frame = CGRect(x: 0, y: addrssTextFeild.frame.size.height - width2, width: addrssTextFeild.frame.size.width, height: addrssTextFeild.frame.size.height)
        border2.borderWidth = width2
        addrssTextFeild.backgroundColor = UIColor.clear
        addrssTextFeild.layer.addSublayer(border2)
        addrssTextFeild.layer.masksToBounds = true
        addrssTextFeild.textColor = UIColor.white
        
        
        addrssTextFeild.leftViewMode = UITextField.ViewMode.always
        let imageView3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image3 = UIImage(named: "address")
        imageView3.image = image3
        addrssTextFeild.leftView = imageView3
        
        var borders = CALayer()
        var widths = CGFloat(1.0)
        borders.borderColor = UIColor.white.cgColor
        borders.frame = CGRect(x: 0, y: passwordTextField.frame.size.height - width, width: passwordTextField.frame.size.width, height: passwordTextField.frame.size.height)
        borders.borderWidth = widths
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.layer.addSublayer(borders)
        passwordTextField.layer.masksToBounds = true
        passwordTextField.textColor = UIColor.white
        
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        let imageViews = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let images = UIImage(named: "password")
        imageViews.image = images
        passwordTextField.leftView = imageViews
        
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "User name",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        addrssTextFeild.attributedPlaceholder = NSAttributedString(string: "Address",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    
    @IBAction func signUpPageFunc(_ sender: Any) {
        
        if (self.userNameTextField.text?.isEmpty)!{
            shakeView(userNameTextField)
        }
        else if self.userNameTextField.text! == " "{
            shakeView(userNameTextField)
        }
        else if (self.emailTextField.text?.isEmpty)!{
            shakeView(emailTextField)
        }
        else if self.isValidEmail(testStr:self.userNameTextField.text!) == false{
            shakeView(emailTextField)
        }
        else if (self.addrssTextFeild.text?.isEmpty)!{
            shakeView(addrssTextFeild)
        }
        else if self.addrssTextFeild.text! == " "{
            shakeView(addrssTextFeild)
        }
        else if (self.passwordTextField.text?.isEmpty)!{
            shakeView(passwordTextField)
        }
        else if self.passwordTextField.text! == " "{
            shakeView(passwordTextField)
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destination = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let navBar = UINavigationController(rootViewController: destination)
            self.present(navBar, animated: true, completion: nil)
        }
        
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
    
    @IBAction func loginPageFunc(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(destination, animated: true, completion: nil)
    }
    
}
