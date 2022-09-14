//
//  Models.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 14.09.22.
//

import Foundation

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



//api
struct Ticket: Codable, Hashable {
    var title: String
    var detail: String
}

struct TeamMember: Codable, Hashable {
    let name: String
    let email: String
}

var myTickets = [Ticket]()
var myTeam = [TeamMember]()
