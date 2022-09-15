//
//  PasscodeVC.swift
//  Finance-app
//
//  Created by Fazil P on 09/09/2022.
//

import UIKit

class PasscodeVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var imageViewCode1: UIImageView!
    @IBOutlet weak var imageViewCode2: UIImageView!
    @IBOutlet weak var imageViewCode3: UIImageView!
    @IBOutlet weak var imageViewCode4: UIImageView!
    @IBOutlet weak var imageViewCode5: UIImageView!
    @IBOutlet weak var imageViewCode6: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(actionCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone))

        loadData()
       
    }
    
    func loadData() {

        titleLabel.text = "Enter\na passcode"
        SubtitleLabel.text = "Enter your secure pin for access your information."
    }


    @objc func actionCancel() {

        dismiss(animated: true)
    }
    
    @objc func actionDone() {

        print(#function)
    }
  

}
