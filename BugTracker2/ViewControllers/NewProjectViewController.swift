//
//  NewProjectViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 29.08.22.
//

import UIKit
import TTGTags

class NewProjectViewController: UIViewController, TTGTextTagCollectionViewDelegate {
    
    let cv = TTGTextTagCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "New Project"
        
        cv.alignment = .center
        cv.delegate = self
        view.addSubview(cv)
        
//        let config = TTGTextTagStyle()
//        config.backgroundColor = .blue
//        config.borderColor = .darkGray
//        config.borderWidth = 1
        cv.addTags(["TTG", "Tag", "collection", "view"])
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cv.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 300)
    }
    
    //configuracoin


}
