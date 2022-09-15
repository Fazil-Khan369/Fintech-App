//
//  LocationVC.swift
//  Finance-app
//
//  Created by Fazil P on 02/09/2022.
//

import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Subtitlelabel: UILabel!
    @IBOutlet weak var Locationlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(actionSkip))
        
        loadData()

    
    }

    func loadData() {
        
        Titlelabel.text = "Choose your\nlocation"
        Subtitlelabel.text = "Please give notification permission for find your nearest friend."
        Locationlabel.text = "Dubai"
    }

    @objc func actionSkip() {
        
        print(#function)
    }

    @IBAction func actionChooselocation(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionDone(_ sender: Any) {
        
        print(#function)
    }
}
