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

  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            self.title = "New Project"
        teamTv.delegate = self
        teamTv.dataSource = self
    }
    
    //Action Btns
    @IBAction func saveProj(){
        let newProj = newProject()
        print("NEW PROJECT : ", newProj)
        if newProj.info.title != "" {
            projects.append(newProj)
            successAlert(title: "Success!", message: "Project Saved", actionTitle: "Back", vc: self)
        }
        else {
            errorAlert(title: "Error", message: "Title needed to save", actionTitle: "Ok", vc: self)
        }
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

extension NewProjectViewController : NewProjectDelegate {
    func fillProject(p: Project) {
        self.projTitle.text = p.info.title
        self.projDescription.text = p.info.description
        self.teamArray = p.sections[1].data
    }
    ///Puts together the new Project object
    func newProject() -> Project {
        let newProj = Project(info: projectInfo(title: projTitle.text ?? "",
                              description: projDescription!.text ?? ""),
            sections: [SectionData(sectionTitle: "Team", data: teamArray)])
        return newProj
    }
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
