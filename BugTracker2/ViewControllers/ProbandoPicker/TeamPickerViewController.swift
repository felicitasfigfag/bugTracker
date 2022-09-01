//
//  TeamPickerViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 31.08.22.
//

import UIKit

class TeamPickerViewController: UIViewController, TeamPickerDelegate{
    
    @IBOutlet var teamView: UIView!

    let addBtn = UIButton(type: .custom)
    let teamTv = UITableView()
    var team = Set<teamMember>()
    var teamArray = [teamMember]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(addBtn)
        self.view.addSubview(teamTv)
        configView()
    }

    
    func configView(){
        let g = view.safeAreaLayoutGuide

        self.addBtn.backgroundColor = .lightGray
        self.addBtn.tintColor = .white
        self.addBtn.setImage(UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill"), for: .normal)
        self.addBtn.translatesAutoresizingMaskIntoConstraints=false
        self.addBtn.topAnchor.constraint(equalTo:self.view.topAnchor, constant: 100).isActive = true
        self.addBtn.leadingAnchor.constraint(equalTo: g.trailingAnchor, constant: -100 ).isActive = true
        self.addBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.addBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.addBtn.addTarget(self, action:#selector(showView), for: .touchUpInside)
        
        self.teamTv.translatesAutoresizingMaskIntoConstraints=false
        self.teamTv.topAnchor.constraint(equalTo: g.topAnchor, constant: 200).isActive = true
        self.teamTv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.teamTv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.teamTv.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: -20).isActive = true
        self.teamTv.separatorStyle = .singleLine
        self.teamTv.register(UITableViewCell.self, forCellReuseIdentifier: "tmCell")
        self.teamTv.dataSource = self
        self.teamTv.delegate = self
    }

    @objc func showView() {
      let picker = TeamPickerView (frame: CGRect(x: 0, y: self.view.frame.height/2, width: self.view.frame.width, height: self.view.frame.height/2))
        //delegate
        picker.delegate = self
        picker.backgroundColor = .lightGray
        self.view.addSubview(picker)
    }
    
    func addTeamMember(tm: teamMember) {
        team.insert(tm)
        teamArray = Array(team)
        teamTv.reloadData()
    }
}

extension TeamPickerViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tmCell", for: indexPath)
        let tm = teamArray[indexPath.row]
        cell.textLabel?.text = tm.name
        return cell
    }
    
    
}

extension TeamPickerViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
