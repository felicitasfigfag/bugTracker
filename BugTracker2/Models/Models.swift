//
//  Models.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//

import Foundation

struct Project {
    var title: String
    var description: String
}
struct Ticket {
    var title: String
    var description: String
    var author: String
}
struct TeamMember {
    var name: String
    var email: String
    var phone: String
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

let tickets = [
    Ticket(
        title: "Change Projects interface",
        description: "Create tableviews to showcase information",
        author: "Felicitas"
    ),
    Ticket(
        title: "Embed everything",
        description: "Embed everything in a tab navigator",
        author: "Gregorio"
    )
]

let team = [
    TeamMember(
        name: "Felicitas",
        email: "felifigueroaf@gmail.com",
        phone: "3976262873"
    ),
    TeamMember(
        name: "Gregorio",
        email: "villagrangregorio@gmail.com",
        phone: "2983298731"
    )
]
