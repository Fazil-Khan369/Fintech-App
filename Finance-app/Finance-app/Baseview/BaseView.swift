//
//  BaseView.swift
//  Finance-app
//
//  Created by Fazil P on 24/08/2022.
//

import UIKit

class BaseView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "List of Views"

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        tableView.tableFooterView = UIView()

        names.append("Login1View")
        names.append("Login2View")
        names.append("Login3View")
        names.append("TEST1111")
    }



}


extension BaseView: UITableViewDataSource {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return names.count
        
        
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

        cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]
        

        return cell
    }
}




extension BaseView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch names[indexPath.row] {
            
        case "LoginView1":
            let login1View = LoginView1()
            login1View.isModalInPresentation = true
            login1View.modalPresentationStyle = .fullScreen
            present(login1View, animated: true)
            
//        case "CurrencyView":
//            let currencyView = CurrencyView()
//            let navController = NavigationController(rootViewController: currencyView)
//            present(navController, animated: true)
            
        default:
            break
        }
    }
}
