//
//  AdminViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 21.08.22.
//

import UIKit

class AdminViewController: UIViewController {
    
    let admin = ["Users", "Configuration", "Settings"]
    @IBOutlet var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}
extension AdminViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}
extension AdminViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Administration"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.admin.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "adminCell", for: indexPath)
        cell.textLabel?.text = self.admin[indexPath.row]
        return cell
}
    }
