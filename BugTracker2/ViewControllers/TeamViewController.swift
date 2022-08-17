//
//  TeamViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class TeamViewController: UIViewController {
    
    @IBOutlet var tv: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self

    }
}
//Delegate
extension TeamViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped " + team[indexPath.row].name)
    }
}
//Data source
extension TeamViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "projectTicketCell", for: indexPath)
        let teamMember = team[indexPath.row]
        
        //aca deberia haber un guard let a ver si tiene todo eso
        cell.textLabel?.text = teamMember.name
        cell.detailTextLabel?.text = teamMember.email
        return cell
    }
}



























