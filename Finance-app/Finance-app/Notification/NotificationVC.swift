//
//  NotificationVC.swift
//  Finance-app
//
//  Created by Fazil P on 07/09/2022.
//

import UIKit

class NotificationVC: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var switchNotification: UISwitch!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(actionClose))

        loadData()
        
        
    }


    func loadData() {

        titleLabel.text = "Turn on\nnotifications"
        SubtitleLabel.text = "Meet new people, create posts, find friends and more."
        switchNotification.isOn = true
        DescriptionLabel.text = "Enable notifications to make sure you don’t miss out the post from your friend"
    }
  
    @objc func actionClose() {

        dismiss(animated: true)
    }

    @IBAction func actionNotification(_ sender: Any) {
        
        print(#function)
    }
}
