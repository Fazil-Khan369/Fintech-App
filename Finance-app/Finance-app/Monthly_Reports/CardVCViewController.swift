//
//  CardVCViewController.swift
//  Finance-app
//
//  Created by Fazil P on 15/09/2022.
//

import UIKit

class CardVCViewController: UIViewController {
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var cellCardName: UITableViewCell!
    @IBOutlet var cellAccountnumber: UITableViewCell!
    @IBOutlet var cellCardholder: UITableViewCell!
    @IBOutlet var cellExpiredate: UITableViewCell!
    
    @IBOutlet var cell3Dsecurity: UITableViewCell!
    
    
    @IBOutlet var CardNameLabel: UILabel!
    @IBOutlet var AccountNumberLabel: UILabel!
    @IBOutlet var CardholderLabel: UILabel!
    @IBOutlet var ExpiredateLabel: UILabel!
    @IBOutlet var securityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    @IBAction func actionReport(_ sender: Any) {
    }
    
    
    @IBAction func actionTransaction(_ sender: Any) {
    }
    

    @IBAction func actionActions(_ sender: Any) {
    }
    

}
















