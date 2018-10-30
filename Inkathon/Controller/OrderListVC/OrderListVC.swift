//
//  OrderListVC.swift
//  Inkathon
//
//  Created by nareshnaidu on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import UIKit

class OrderListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var orderListTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.orderListTV.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "OrderCell")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 134/255, green: 61/255, blue: 21/255, alpha: 1.0)
         self.navigationController?.navigationBar.topItem?.title = "ORDER LIST"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderListTV.dequeueReusableCell(withIdentifier: "OrderCell") as! OrderCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130
    }

}
