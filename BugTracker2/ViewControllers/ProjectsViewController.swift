//
//  DashboardViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    @IBOutlet var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self

    }
}


extension ProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped " + projects[indexPath.row].title)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "project") as? ProjectViewController {
            navigationController?.pushViewController(vc, animated: true)}
            
        }
}

extension ProjectsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "projectsCell", for: indexPath)
        let project = projects[indexPath.row]
        
        cell.textLabel?.text = project.title
        cell.detailTextLabel?.text = project.description
        return cell
    }
}



























