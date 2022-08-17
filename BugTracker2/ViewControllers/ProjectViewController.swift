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
    lazy var mySections: [SectionData] = {
        let section1 = SectionData(title: "Tickets", data: "Update interface", "Move strings from VC", "Commit to github", "Change styles from cells", "Add buttons to add tm/ticket", "Add navigation")
        let section2 = SectionData(title: "Team", data: "Felicitas", "Gregorio", "Rafael")

        return [section1, section2]
    }()
}

extension ProjectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped ")
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
        let cellTitle = mySections[indexPath.section][indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: pString.cellIdentifier, for: indexPath) as! UITableViewCell
        cell.textLabel?.text = cellTitle

        return cell
    }
   
}




struct SectionData {
    let title: String
    let data : [String]

    //number of items in a section
    var numberOfItems: Int {
        return data.count
    }

    subscript(index: Int) -> String {
        return data[index]
    }
}

extension SectionData {
    //  Putting a new init method here means we can
    //  keep the original, memberwise initaliser.
    init(title: String, data: String...) {
        self.title = title
        self.data  = data
    }
}





















