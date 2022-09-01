//
//  NewProjectViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 29.08.22.
//

import UIKit

class NewProjectViewController: UIViewController, TeamPickerDelegate {

    @IBOutlet var teamTv : UITableView!
    @IBOutlet var addBtn : UIButton!
    var team = Set<teamMember>()
    var teamArray = [teamMember]()
    
    @IBAction func showView(){
        let picker = TeamPickerView (frame: CGRect(x: 0, y: 550, width: self.view.frame.width, height: self.view.frame.height/4))
          picker.delegate = self
          self.view.addSubview(picker)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "New Project"
        teamTv.delegate = self
        teamTv.dataSource = self
    }
    
    func addTeamMember(tm: teamMember) {
        team.insert(tm)
        teamArray = Array(team)
        teamTv.reloadData()
    }
}

extension NewProjectViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       self.teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
        let tm = teamArray[indexPath.row]
        cell.textLabel?.text = tm.name
        return cell
    }
    
    
}

extension NewProjectViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
