//
//  DashboardViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet var tv: UITableView!
    struct Project {
        var title: String
        var description: String
    }
    let projects = [
        //esto va a pasar a models despues, y dsp lo vamos a sacar de una base de datos
        Project(
            title: "Bug Tracker",
            description: "Bug tracker application"
        ),
        Project(
            title: "Netflix Clone",
            description: "Excellent netflix clone"
        )
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self

    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "projectsCell", for: indexPath)
        let project = self.projects[indexPath.row]
        
        cell.textLabel?.text = project.title
        cell.detailTextLabel?.text = project.description
        return cell
    }
}



























