//
//  Protocols.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 08.09.22.
//

import Foundation

protocol ProjectViewControllerDelegate {
    //from second to first: Updates ProjectVC after edit in Newproject
    func updateMain(p: Project)
}
