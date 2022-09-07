//
//  DashboardViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class ProjectViewController: UIViewController {
    
    var project : Project?
    @IBOutlet var tv: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
    }
    @objc func signUpButtonPressedTapped()  {

       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: "NewProjectViewController") as! NewProjectViewController
       self.navigationController?.pushViewController(vc, animated: true)
        vc.title = project?.info.title
        guard let project = project else {
            return
        }

        vc.fillProject(p: project)
    }
    
    @IBAction func editBtnAction(_ sender: Any)  {
         signUpButtonPressedTapped()
    }

}

//aqui las celdas son las secciones
extension ProjectViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = project!.sections[indexPath.section].sectionTitle
        print(cell)
    }
}

extension ProjectViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let project = project else {return defaultProject.numberOfItems}
        return project.sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let project = project else {return defaultProject.sections[section].sectionTitle}
        return project.sections[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let project = project else {return defaultProject.sections[section].data.count}
        return project[section].numberOfItems
    }
//generando secciones
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = project?.sections[indexPath.section].data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: pString.cellIdentifier, for: indexPath)
        cell.textLabel?.text = section?.title
        cell.detailTextLabel?.text = section?.detail
        return cell
    }
   
}

extension SectionData {
    //  Putting a new init method here means we can
    //  keep the original, memberwise initaliser.
    //aqui le saque 3 puntos
    init(title: String, data: [dataItem]) {
        self.sectionTitle = title
        self.data = data
    }
}
extension ProjectViewController : ProjectViewControllerDelegate {
    
    func updateMain(p: Project) {
        print("Updating main")
        print("This is the new project ", p.info.title)
        self.project = p
    }
}

protocol NewProjectDelegate {
    //from first to second: fills 2nd with project of first
    func fillProject(p: Project?) async
}
protocol ProjectViewControllerDelegate {
    //from second to first: Updates ProjectVC after edit in Newproject
    func updateMain(p: Project)
}
