//
//  SettingsVC.swift
//  Finance-app
//
//  Created by Fazil P on 19/09/2022.
//

import UIKit

class SettingsVC: UIViewController {
    
    
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var SubtitleLabel: UILabel!
    @IBOutlet var ButtonProfile: UIButton!
    @IBOutlet var SearchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        loadData()
        
    }
    
    
    func loadData() {
        
        SubtitleLabel.text = "Long Sample Text"
    }
    
    
    
    @IBAction func actionProfile(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    
    @IBAction func actionLimit(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    @IBAction func actionMonthlyReport(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    @IBAction func actionSecurityTouchID(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    @IBAction func actionNotification(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    
    
    
}
