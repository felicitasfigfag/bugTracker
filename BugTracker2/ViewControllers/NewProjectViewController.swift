//
//  NewProjectViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 29.08.22.
//

import UIKit

class NewProjectViewController: UIViewController {
    
    @IBOutlet var picker : UIPickerView!
    
    let team = ["Felicitas", "Gregorio", "Nick", "Joe", "Kevin"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "New Project"
        // Do any additional setup after loading the view.
    }
    



}
