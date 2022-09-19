//
//  Notification.swift
//  Finance-app
//
//  Created by Fazil P on 19/09/2022.
//

import UIKit

class Notification: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cellProductUpdates: UITableViewCell!
    @IBOutlet var cellOfferUpdate: UITableViewCell!
    @IBOutlet var cellComments: UITableViewCell!
    @IBOutlet var cellNotification: UITableViewCell!
    
    
    @IBOutlet var switchProductUpdates: UISwitch!
    @IBOutlet var switchOfferUpdates: UISwitch!
    @IBOutlet var switchComments: UISwitch!
    @IBOutlet var switchNotification: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Notifications"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))
        
        loadData()
    }


    func loadData() {
        
        switchProductUpdates.setOn(true, animated: true)
        switchOfferUpdates.setOn(false, animated: true)
        switchComments.setOn(true, animated: true)
        switchNotification.setOn(false, animated: true)
    }


    @objc func actionProfile(_ sender: UIButton) {
        
        print(#function)
    }
    
}


extension Notification: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) { return cellProductUpdates }
        if(indexPath.row == 1) { return cellOfferUpdate }
        if(indexPath.row == 2) { return cellComments }
        if(indexPath.row == 3) { return cellNotification }
        
        print("TTTT")
        
        return UITableViewCell()
    }
    
}

extension Notification: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
}






