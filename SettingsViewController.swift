//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Douglas Hewitt on 3/4/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var settingsTableView: UITableView!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
//        settingsTableView.allowsMultipleSelection = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "0.18"
        case 1:
            cell.textLabel?.text = "0.2"
        default:
            cell.textLabel?.text = "0.25"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Default Tip Percentage"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tip = defaults.object(forKey: "defaultTip") as? Double else {return}
        
        switch indexPath.row {
        case 0:
            if tip == 0.18 {
                cell.accessoryType = .checkmark
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            }
        case 1:
            if tip == 0.2 {
//                cell.setSelected(true, animated: false)
                cell.accessoryType = .checkmark
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)

            }
        default:
            if tip == 0.25 {
//                cell.setSelected(true, animated: false)
                cell.accessoryType = .checkmark
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)

            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedTip = 0.0

        switch indexPath.row {
        case 0:
            selectedTip = 0.18
        case 1:
            selectedTip = 0.2
        default:
            selectedTip = 0.25
        }
        
        defaults.set(selectedTip, forKey: "defaultTip")
        defaults.synchronize()
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
