//
//  MyCustomTableView.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 26/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyCustomTableView: UIViewController {
    /// 1.
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Country] = CountryGetter().getAllCountries()
    let control = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 2.
        tableView.delegate = self
        tableView.dataSource = self
        // pour avoir le chargement lors du refresh
        tableView.refreshControl = control
        // pour avoir un titre lors du chargement
        control.attributedTitle = NSAttributedString(string: "chargement des données")
        // changer la couleur du chargement
        control.tintColor = .red
        control.addTarget(self, action: #selector(reload), for: .valueChanged)
    }
    
    @objc func reload() {
        countries = CountryGetter().getAllCountries()
        // recharge les données
        tableView.reloadData()
        control.endRefreshing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pop", let next = segue.destination as? DetailViewController {
            next.country = sender as? Country
            
        }
    }

}
/// 3.
extension MyCustomTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Utilisation de la cell custom :
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? MyFirstCell2 {
            cell.setupCell(countries[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pop", sender: countries[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
           
        }
    }
    
    
    
    
}
