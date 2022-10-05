//
//  ListVC.swift
//  Finance-app
//
//  Created by Fazil P on 03/10/2022.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var SearchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    private var stores: [[String: String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never

        navigationItem.titleView = segmentedControl
        navigationItem.titleView?.frame = CGRect(x: 0, y: 0, width: 200, height: 30)

        tableView.register(UINib(nibName: "ListViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ListViewCell")
        
        updateUI()
        loadData()
    }


    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        super.traitCollectionDidChange(previousTraitCollection)
        updateUI()
    }
    
  
    func updateUI() {
        
        let background = UIColor.systemBackground.image(segmentedControl.frame.size)
        let selected = AppColor.Theme.image(segmentedControl.frame.size)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected )
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
        segmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = AppColor.Theme.cgColor
        
    }
    
    func loadData() {
        
        stores.removeAll()
        
        var dict1: [String: String] = [:]
        dict1["name"] = "KFC"
        dict1["distance"] = "3.3 km"
        dict1["address"] = "Downtown, Dubai"
        dict1["status"] = "Open Now"
        dict1["time"] = "9:00 AM - 12:00 AM"
        stores.append(dict1)
        


        var dict2: [String: String] = [:]
        dict2["name"] = "Ovenstory Pizza"
        dict2["distance"] = "2.4 km"
        dict2["address"] = "Al Karama, UAE"
        dict2["status"] = "Closed"
        dict2["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict2)

        var dict3: [String: String] = [:]
        dict3["name"] = "NBA Store NYC 5th Ave"
        dict3["distance"] = "9 km"
        dict3["address"] = "Al Barsha Dubai"
        dict3["status"] = "Closed"
        dict3["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict3)

        var dict4: [String: String] = [:]
        dict4["name"] = "New York & Company"
        dict4["distance"] = "6 km"
        dict4["address"] = "MANHATTAN MALL, 100 W 33rd St"
        dict4["status"] = "Open Now"
        dict4["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict4)

        var dict5: [String: String] = [:]
        dict5["name"] = "Macy's"
        dict5["distance"] = "27 km"
        dict5["address"] = "151 W 34th St, New York"
        dict5["status"] = "Closed"
        dict5["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict5)

        var dict6: [String: String] = [:]
        dict6["name"] = "Paragon Sports"
        dict6["distance"] = "10.3 km"
        dict6["address"] = "867 Broadway, New York"
        dict6["status"] = "Open Now"
        dict6["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict6)

        var dict7: [String: String] = [:]
        dict7["name"] = "The New York Public Library Shop"
        dict7["distance"] = "4.6 km"
        dict7["address"] = "Fifth Avenue and, W 42nd St, New York"
        dict7["status"] = "Open Now"
        dict7["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict7)

        var dict8: [String: String] = [:]
        dict8["name"] = "Nintendo NY"
        dict8["distance"] = "7.8 km"
        dict8["address"] = "10 Rockefeller Plaza, New York"
        dict8["status"] = "Closed"
        dict8["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict8)

        var dict9: [String: String] = [:]
        dict9["name"] = "Apple Fifth Avenue"
        dict9["distance"] = "1 km"
        dict9["address"] = "767 5th Ave, New York"
        dict9["status"] = "Closed"
        dict9["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict9)

        var dict10: [String: String] = [:]
        dict10["name"] = "Saks Fifth Avenue"
        dict10["distance"] = "2.9 km"
        dict10["address"] = "611 5th Ave, New York"
        dict10["status"] = "Open Now"
        dict10["time"] = "9:00 AM - 6:00 PM"
        stores.append(dict10)

        refreshTableView()
        
    }
    
    func refreshTableView() {
        
        tableView.reloadData()
    }
    
    
    @IBAction func actionSegmentChange(_ sender: Any) {
        
        print(#function)
    }
    

}



extension ListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
        cell.bindData(data: stores[indexPath.row])
        return cell
    }
    
}

extension ListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 115
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(#function)
    }
    
}

fileprivate extension UIColor {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
