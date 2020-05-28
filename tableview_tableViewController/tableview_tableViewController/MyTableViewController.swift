//
//  MyTableViewController.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 26/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var countries: [Country] = CountryGetter().getAllCountries()
    var continents: [Continent] = CountryGetter().getContinents()

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Pour rajouter le bouton edit en haut sur l'écran :
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "push", let next = segue.destination as? DetailViewController else { return }
        next.country = sender as? Country
    }

    // MARK: - Table view data source
    
    //  Nombre de sections :

    override func numberOfSections(in tableView: UITableView) -> Int {
        return continents.count
    }
    
    // Nombre de row :
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
        return continents[section].countries.count
    }

    // MARK: - Edition des cellules
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// je récupère l'array continent par rapport à sa section puis le pays par rapport à sa ligne :
        let country = continents[indexPath.section].countries[indexPath.row]
        // Avec une cell custom
        if let cellCustom = tableView.dequeueReusableCell(withIdentifier: "firstCell") as? MyFirstCell {
            cellCustom.country = country
            return cellCustom
        }
        // Sinon retourner cette cell
        /// spécifier ce que la cellule doit montrer
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        /// Sans section :
//        let index = indexPath.row
//        let country = countries[index]
     
        cell.textLabel?.text = country.name
        
        cell.textLabel?.textColor = .systemRed
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        // le sous-titre :
        cell.detailTextLabel?.text = country.capital
        cell.detailTextLabel?.textColor = .secondaryLabel
        // style de la row sélectionnée :
        cell.selectionStyle = .none
        
        return cell

    }
    
    /// Si on veut des styles différents :
       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// Il faut que la taille de la cell soit aussi à 125 dans le Main.storyboard
           return 125
       }
    
    // MARK: - Sélection des row
    
    // Quand on sélectionne et déselectionne une cell :
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "push", sender: countries[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselected: \(countries[indexPath.row].name)")
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    /// On peut maintenant glisser vers la droite pour supprimer une row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            countries.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
// MARK:- Déplacer une row
    
    /// juste en décommentant ces deux méthodes suivantes on peut déplacer  une row dans lécran :
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let c = countries[fromIndexPath.row]
        countries.remove(at: fromIndexPath.row)
        countries.insert(c, at: to.row)
        
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    // MARK: - Header et Footer des sections
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section].name
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // Cette méthode va overrider le titleForHeader :
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//                let v = UIView()
//        v.backgroundColor = .purple
//        return v
//    }
    
    // Footer des sections :
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Fin de \(continents[section].name)"
    }
    
    // Cette méthode va overrider le titleForFooterInSection :
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .systemTeal
        return v
    }
   
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
