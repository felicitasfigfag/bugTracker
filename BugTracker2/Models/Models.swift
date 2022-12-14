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

struct teamMember: Hashable {
    let name: String
    let email: String
}

///The objects: ticket and team
struct dataItem : Hashable {
    let title: String
    let detail: String
    let other: String
}

// Section data (Project)
//With this we can use different info for the different sections of the same table
struct SectionData {
    let sectionTitle: String
    let data : [dataItem]
    
    var numberOfItems: Int {
        return data.count
    }

    subscript(index: Int) -> dataItem {
        return data[index]
    }}

///The items of data the project will receive




//asignaciones
let bugTracker = Project(
                    info: projectInfo(title: "Bug tracker",
                                      description: "New project"),
                    
                    sections: [SectionData(sectionTitle: "Tickets",
                                           data: [dataItem(title: "Update interface",
                                                           detail: "Add the remaining screens",
                                                           other: "Type: Other"),
                                                  dataItem(title: "Do something",
                                                           detail: "This is something we do",
                                                           other: "BLalalal")]),
                               SectionData(sectionTitle: "Team",
                                           data: [dataItem(title: "Felicitas",
                                                           detail: "felifigueroaf@gmail.com",
                                                           other: "3287652345870"),
                                                  dataItem(title: "Feli",
                                                           detail: "felicitas@gmail",
                                                           other: "3e93949")])])

let defaultProject = Project(
                    info: projectInfo(title: "Pending title",
                                      description: "default default"),
                    
                    sections: [SectionData(sectionTitle: "Tickets",
                                           data: [dataItem(title: "You don't have any tickets yet",
                                                           detail: "",
                                                           other: "")
                                                  ]),
                               SectionData(sectionTitle: "Team",
                                           data: [dataItem(title: "There are no team members yet!",
                                                           detail: "default",
                                                           other: "default")])])

let netflixClone = Project(
                    info: projectInfo(title: "Netflix Clone",
                                      description: "Dupe projects"),
                    
                    sections: [SectionData(sectionTitle: "Tickets",
                                           data: [dataItem(title: "Start a branch on github",
                                                           detail: "Add all the information",
                                                           other: "Type: Other")]),
                               SectionData(sectionTitle: "Team",
                                           data: [dataItem(title: "Gregorio",
                                                           detail: "villagrangregorio@gmail.com",
                                                           other: "876543456789")])])

var projects = [bugTracker, netflixClone]

let team = [dataItem(title: "Felicitas", detail: "felifigueroaf@gmail.com", other: ""),
            dataItem(title: "Gregorio", detail: "villagrangregorio@gmail.com", other: ""),
            dataItem(title: "Hansa Lucas", detail: "hanslucas@gmail.com", other: ""),
            dataItem(title: "Thackery Binx", detail: "gatosarnoso@gmail.com", other: "")]


//Strings extension: Project
struct ProjStrings {
    var sTitle: String
    var sTitle2: String
    var cellIdentifier: String
}

let pString = ProjStrings(sTitle: "Tickets", sTitle2: "Team", cellIdentifier: "projCell")
