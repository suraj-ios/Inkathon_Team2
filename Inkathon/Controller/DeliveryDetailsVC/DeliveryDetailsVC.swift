//
//  DeliveryDetailsVC.swift
//  Inkathon
//
//  Created by nareshnaidu on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import UIKit

class DeliveryDetailsVC: UIViewController {

    @IBOutlet weak var completeBtn: UIButton!
    @IBOutlet weak var partialBtn: UIButton!
    @IBOutlet weak var rejectBtn: UIButton!
    
    
    @IBOutlet weak var deliveryNote: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var shipTo: UILabel!
    @IBOutlet weak var delivery: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.completeBtn.layer.cornerRadius = 3.0
        self.completeBtn.clipsToBounds = true
        self.partialBtn.layer.cornerRadius = 3.0
        self.partialBtn.clipsToBounds = true
        self.rejectBtn.layer.cornerRadius = 3.0
        self.rejectBtn.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.barTintColor = UIColor(red: 134/255, green: 61/255, blue: 21/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
    
    
    @IBAction func CompleteAction(_ sender: Any) {
    }
    
    @IBAction func PartialAction(_ sender: Any) {
    }
    
    @IBAction func rejectAction(_ sender: Any) {
    }
    
}
