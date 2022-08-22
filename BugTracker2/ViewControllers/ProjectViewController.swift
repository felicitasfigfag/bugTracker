//
//  DashboardViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import UIKit

class ProjectViewController: UIViewController {
    
    //var mySections = [ticketData, teamData]
    var project : Project?
    @IBOutlet var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
    }
}

//aqui las celdas son las secciones
extension ProjectViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = project!.sections[indexPath.section].sectionTitle
        print(cell)
        //no se que es esto
    }
}

extension ProjectViewController: UITableViewDataSource {
    
func numberOfSections(in tableView: UITableView) -> Int {
    return project!.sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return project!.sections[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project!.numberOfItems
        //quizas esto no ande, deberia poder pedir el number of items en la seccion recien
    }
//generando secciones
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let section = project?.sections[indexPath.section].data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: pString.cellIdentifier, for: indexPath)
        //var title : String : ""
       // title = cells.
       // cell.textLabel?.text = sectio
       // cell.detailTextLabel?.text = cells.description
        //other?
        return cell
    }
   
}

extension SectionData {
    //  Putting a new init method here means we can
    //  keep the original, memberwise initaliser.
    //aqui le saque 3 puntos
    init(title: String, data: dataItem) {
        self.sectionTitle = title
        self.data = data
    }
}





















