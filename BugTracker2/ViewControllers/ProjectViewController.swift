//
//  DashboardViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class ProjectViewController: UIViewController {
    
    @IBOutlet var tv: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self

    }
}

extension ProjectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped " + tickets[indexPath.row].title)
    }
}

extension ProjectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "projectTeamCell", for: indexPath)
        let ticket = tickets[indexPath.row]
        
        //aca deberia haber un guard let a ver si tiene todo eso 
        cell.textLabel?.text = ticket.title
        cell.detailTextLabel?.text = ticket.description
        return cell
    }
}



























