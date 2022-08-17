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

let projects = [
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
