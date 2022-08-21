//
//  DashboardViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class ProjectViewController: UIViewController {
    
    var mySections = [ticketData, teamData]
    //var title : String()
    
    @IBOutlet var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
    }
}


extension ProjectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = mySections[indexPath.section]
        let cell = mySections[indexPath.section][indexPath.row]
        print(section.title, " : ", cell.title)
    }
}

extension ProjectViewController: UITableViewDataSource {
    
func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySections[section].numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = mySections[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: pString.cellIdentifier, for: indexPath)
        cell.textLabel?.text = cells.title
        cell.detailTextLabel?.text = cells.description
        //other?
        return cell
    }
   
}

extension SectionData {
    //  Putting a new init method here means we can
    //  keep the original, memberwise initaliser.
    init(title: String, data: dataItem...) {
        self.title = title
        self.data  = data
    }
}





















