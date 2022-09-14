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
    var dirty = false
    var dirtyIndex = Int()
    var delegate2 : ProjectViewControllerDelegate?
    //TextFields
    @IBOutlet var projTitle : UITextField!
    @IBOutlet var projDescription: UITextField!
    var delegate : ProjectViewControllerDelegate?

  
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
    
    
    @IBAction func saveProj(){
        let newProj = newProject()
            if newProj.info.title != "" {
                if dirty {
                    //delegate?.updateMain(p: newProj)
                    updateProj(oldIndex: dirtyIndex, newProj: newProj)
                    self.dismiss(animated: true)
                }
                else {
                  projects.append(newProj)
                }
                successAlert(title: "Success!", message: "Project Saved", actionTitle: "Back", vc: self)
            }
            else {
                errorAlert(title: "Error", message: "Title needed to save", actionTitle: "Ok", vc: self)
            }
        
    }
    
    func updateProj(oldIndex: Int, newProj: Project){
        projects.remove(at: oldIndex)
        projects.insert(newProj, at: oldIndex)
    }
}

extension NewProjectViewController : NewProjectDelegate {
        
    func fillProject(p: Project?, i: Int) {
        guard let p = p else {return}
        self.dirty = true
        self.dirtyIndex = i
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.title = "Edit Project"
            self.projTitle.text = p.info.title
            self.projDescription.text = p.info.description
            //WHat
            self.teamArray = p.sections[1].data
        }
        
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


