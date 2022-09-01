//
//  NewProjectViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 29.08.22.
//

import UIKit

class NewProjectViewController: UIViewController, TeamPickerDelegate {
    
    //team
    @IBOutlet var teamTv : UITableView!
    @IBOutlet var addBtn : UIButton!
    var team = Set<dataItem>()
    var teamArray = [dataItem]()
    
    //TextFields
    @IBOutlet var projTitle : UITextField!
    @IBOutlet var projDescription: UITextField!
    
    @IBAction func saveProj(){
        newProject()
        showAlert(title: "Success", message: "Project Saved", actionTitle: "Go back")
    }
    
    func newProject(){
        let newProj = Project(info: projectInfo(title: projTitle.text ?? "",
                                                description: projDescription!.text ?? ""),
                              sections: [SectionData(sectionTitle: "Team", data: teamArray)])
        print(newProj)
    }
    
    func showAlert( title: String, message: String, actionTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler:{_ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "New Project"
        teamTv.delegate = self
        teamTv.dataSource = self
    }
    
    /// Team
    @IBAction func showPickerView(){
        let picker = TeamPickerView (frame: CGRect(x: 0, y: 550, width: self.view.frame.width, height: self.view.frame.height/4))
          picker.delegate = self
          self.view.addSubview(picker)
      }
    
    func addTeamMember(tm: dataItem) {
        team.insert(tm)
        teamArray = Array(team)
        teamTv.reloadData()
    }
    
    /// Text Fields
    
}

extension NewProjectViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       self.teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
        let tm = teamArray[indexPath.row]
        cell.textLabel?.text = tm.title
        return cell
    }
    
    
}

extension NewProjectViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
