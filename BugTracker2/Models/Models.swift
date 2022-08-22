//
//  Models.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import Foundation

//In here I'll gather information that will be extracted from backend in the future.

//Projects
struct Project {
    var title: String
    var description: String
}
// Project es el modelo de proyecto
struct ProjectModel {
    var info: projectInfo
    var tickets: [ticketItem]
    var team: [teamItem]
}
struct projectInfo {
    var title: String
    var description: String
}
struct ticketItem {
    let title: String
    let description: String
    let other: String?
}
struct teamItem {
    let name: String
    let email: String
    let other: String?
}








//asignaciones
let bugTracker = ProjectModel(
    info: projectInfo(title: "Bug tracker",
                      description: "New project"),
    tickets: [ticketItem(title: "Update interface",
                                         description: "Add the remaining screens",
                                         other: "Type: Other")],
                    team: [teamItem(name: "Feli",
                                    email: "felifigueroaf@gmail.com",
                                    other: "Number: 029238")])



let netflixClone = ProjectModel(
    info: projectInfo(title: "Netflix Clone",
                      description: "Dupe project"),
    tickets: [ticketItem(title: "Start a branch on github",
                                         description: "Add all the information",
                                         other: "Type: Other")],
    team: [teamItem(name: "Gregorio",
                                    email: "villagrangregoriof@gmail.com",
                                    other: "Number: 02343567876543")])

let projects = [bugTracker, netflixClone]



let projectsOld = [
    Project(
        title: "Bug Tracker",
        description: "Bug tracker application"
    ),
    Project(
        title: "Netflix Clone",
        description: "Excellent netflix clone"
    )
]

//Strings extension: Project

struct ProjStrings {
    var sTitle: String
    var sTitle2: String
    var cellIdentifier: String
}

let pString = ProjStrings(sTitle: "Tickets", sTitle2: "Team", cellIdentifier: "projCell")


// Section data (Project)
//With this we can use different info for the different sections of the same table

struct SectionData {
    let title: String
    let data : [dataItem]

    //number of items in a section
    var numberOfItems: Int {
        return data.count
    }

    subscript(index: Int) -> dataItem {
        return data[index]
    }
}

struct dataItem {
    let title: String
    let description: String
    let other: String?
}

let ticketData = SectionData(title: "Tickets",
                             data: [
                                dataItem(title: "Update Interface",
                                        description: "You should add new buttons",
                                        other: "Responsable: Feli"),
                                dataItem(title: "Move strings from VC",
                                        description: "Towards an extension or struct",
                                        other: "Nil")
                             ])
let teamData = SectionData(title: "Team",
                             data: [
                                dataItem(title: "Felicitas",
                                        description: "felifigueroa@gmail.com",
                                        other: "nil"),
                                dataItem(title: "Gregorio",
                                        description: "villagrangregorio@gmail.com",
                                        other: "nil")
                             ])
