//
//  SettingsVC2.swift
//  Finance-app
//
//  Created by Fazil P on 27/09/2022.
//

import UIKit

class SettingsVC2: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var CellUser: UITableViewCell!
    
    @IBOutlet var CellNotification: UITableViewCell!
    @IBOutlet var CellInviteFriends: UITableViewCell!
    @IBOutlet var CellTouchID: UITableViewCell!
    @IBOutlet var CellCards: UITableViewCell!
    @IBOutlet var CellSupport: UITableViewCell!
    @IBOutlet var CellFeedback: UITableViewCell!
    
    @IBOutlet var UserImageview: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var EmailIDLabel: UILabel!
    @IBOutlet var TouchIDswitch: UISwitch!
    @IBOutlet var CardsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        super.viewDidLoad()
        title = "Settings"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadData()
        
        
    }


    func loadData() {
        
        UserImageview.sample("Finance", "Businessmen", 1)
        NameLabel.text = "Fazil"
        EmailIDLabel.text = "Fazil@dxb.com"
        TouchIDswitch.setOn(true, animated: true)
        CardsLabel.text = "3"
    }


}


extension SettingsVC2: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) { return CellUser            }
        if (indexPath.row == 1) { return CellNotification    }
        if (indexPath.row == 2) { return CellInviteFriends    }
        if (indexPath.row == 3) { return CellTouchID        }
        if (indexPath.row == 4) { return CellCards            }
        if (indexPath.row == 5) { return CellSupport        }
        if (indexPath.row == 6) { return CellFeedback        }

        return UITableViewCell()
    }
    
}

extension SettingsVC2: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row == 0) { return 95 }
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(#function)
    }
    
}



















