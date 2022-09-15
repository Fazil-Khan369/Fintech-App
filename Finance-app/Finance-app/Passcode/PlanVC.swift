//
//  PlanVC.swift
//  Finance-app
//
//  Created by Fazil P on 09/09/2022.
//

import UIKit

class PlanVC: UIViewController {  
    
    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Subtitlelabel: UILabel!
    @IBOutlet weak var Tableview: UITableView!
    @IBOutlet weak var constraintTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var Descriptionlabel: UILabel!
    
    
    private var plans: [[String: String]] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(actionSkip))
        
        Tableview.register(UINib(nibName: "PlanCell", bundle: nil), forCellReuseIdentifier: "PlanCell")
        Tableview.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        loadData()
        
        

        
    }

    
    func loadData() {
        
        Titlelabel.text = "Subscription\nPlan"
        Subtitlelabel.text = "Biggest collection\nof news, article & news"
        Descriptionlabel.text = "Choose plan to access various\ncontent for defined time period"
        
        plans.removeAll()
        
        var dict1: [String: String] = [:]
        dict1["title"] = "Start - Free"
        dict1["description"] = "Learn, explore, and create"
        plans.append(dict1)
        
        var dict2: [String: String] = [:]
        dict2["title"] = "Professional - $20/m"
        dict2["description"] = "A good fit for landing pages"
        plans.append(dict2)
        
        var dict3: [String: String] = [:]
        dict3["title"] = "Team - $50/m"
        dict3["description"] = "For more complex projects"
        plans.append(dict3)
        
        refreshTableView()
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let obj = object as? UITableView {
            if obj == Tableview && keyPath == "contentSize" {
                if let newSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {
                    constraintTableViewHeight.constant = newSize.height
                    
                }
            }
        }
    }

    @objc func actionSkip() {
        
        print(#function)
    }
    func refreshTableView() {
        Tableview.reloadData()
    }

}


extension PlanVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = Tableview.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath) as! PlanCell
        cell.bindData(data: plans[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension PlanVC:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectItemAt \(indexPath.row)")
        
        let cell = Tableview.cellForRow(at: indexPath) as! PlanCell
        cell.Imageview.image = UIImage(systemName: "smallcircle.fill.circle.fill")
        cell.Imageview.tintColor = AppColor.Theme
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        print("didDeSelectItemAt \(indexPath.row)")
        
        let cell = Tableview.cellForRow(at: indexPath) as! PlanCell
        cell.Imageview.image = UIImage(systemName: "circle.fill")
        cell.Imageview.tintColor = UIColor.secondaryLabel
    }
}


































