//
//  DashboardViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tv.reloadData()
    }
    
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProjectViewController") as! ProjectViewController
       self.navigationController?.pushViewController(vc, animated: false)
        vc.project = projects[indexPath.row]
        vc.index = indexPath.row
        vc.title = projects[indexPath.row].info.title
        }
   
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "projectsCell", for: indexPath)
        let project = projects[indexPath.row]
        
        cell.textLabel?.text = project.info.title
        cell.detailTextLabel?.text = project.info.description
        return cell
    }
}
