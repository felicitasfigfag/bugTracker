//
//  Models.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import Foundation

//In here I'll gather information that will be extracted from backend in the future.


// Project es el modelo de proyecto
struct Project {
    var info: projectInfo
    var sections: [SectionData]
    
    var numberOfItems: Int {
        return sections.count
    }

    subscript(index: Int) -> SectionData {
        return sections[index]
    }
}

///info and description of the project
struct projectInfo {
    var title: String
    var description: String
}


///The objects: ticket and team
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

// Section data (Project)
//With this we can use different info for the different sections of the same table

struct SectionData {
    let sectionTitle: String
    let data : dataItem
}

///The items of data the project will receive
enum dataItem {
    case ticket(ticketItem)
    case team(teamItem)
}




//asignaciones
let bugTracker = Project(
                    info: projectInfo(title: "Bug tracker",
                                      description: "New project"),
                    
                    sections: [SectionData(sectionTitle: "Tickets",
                                           data: dataItem.ticket(
                                                                ticketItem(title: "Update interface",
                                                                           description: "Add the remaining screens",
                                                                           other: "Type: Other"))),
                               SectionData(sectionTitle: "Team",
                                           data: dataItem.team(
                                                                teamItem(name: "Felicitas",
                                                                         email: "felifigueroaf@gmail.com",
                                                                         other: "3287652345870")))])

let netflixClone = Project(
                    info: projectInfo(title: "Netflix Clone",
                                      description: "Dupe projects"),
                    
                    sections: [SectionData(sectionTitle: "Tickets",
                                           data: dataItem.ticket(
                                                                ticketItem(title: "Start a branch on github",
                                                                           description: "Add all the information",
                                                                           other: "Type: Other"))),
                               SectionData(sectionTitle: "Team",
                                           data: dataItem.team(
                                                                teamItem(name: "Gregorio",
                                                                         email: "villagrangregorio@gmail.com",
                                                                         other: "876543456789")))])

let projects = [bugTracker, netflixClone]



//Strings extension: Project

struct ProjStrings {
    var sTitle: String
    var sTitle2: String
    var cellIdentifier: String
}

let pString = ProjStrings(sTitle: "Tickets", sTitle2: "Team", cellIdentifier: "projCell")
