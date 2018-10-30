//
//  HomeViewController.swift
//  Inkathon
//
//  Created by nareshnaidu on 27/10/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var listingCollectionView: UICollectionView!
    
    var data = [ListProductData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listingCollectionView.register(UINib(nibName:"ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.topItem?.title = "HOME"
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 134/255, green: 61/255, blue: 21/255, alpha: 1.0)
        
        if Reachability.isConnectedToNetwork(){
            self.dashboardAPICall()
        }
        else{
            showAlert(alertString: "No internet connection.Please try again!")
        }
        
    }
    
    func dashboardAPICall(){
        SVProgressHUD.show()
        WebServices.sharedInstance.getHomeFeed(completionHandler: { (response, error) in
            SVProgressHUD.dismiss()
                if let responseData = response?.data {
                    SVProgressHUD.dismiss()
                    self.data = responseData
                    DispatchQueue.main.async {
                        self.listingCollectionView.reloadData()
                    }
                    
            }else {
                SVProgressHUD.dismiss()
            }
        })
    }
    
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor(red:0.89, green:0.84, blue:0.84, alpha:1.0).cgColor
            cell.productname.text = self.data[indexPath.row].name
            cell.cosr.text = self.data[indexPath.row].cost
        
            //cell.imgView.sd_setImage(with: URL(string: self.data[indexPath.row].image), completed: nil)
            
            return cell
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "DeliveryDetailsVC") as! DeliveryDetailsVC
        
        let navBar = UINavigationController(rootViewController: destination)
        //self.present(navBar, animated: true, completion: nil)
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let nbCol = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 2))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
        return CGSize(width: size - 3, height: 205)
        
    }
    func showAlert(alertString:String){
        let alert = UIAlertController(title: "Alert!", message: alertString, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
