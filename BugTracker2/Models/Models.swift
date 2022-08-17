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
// Tickets
struct Ticket {
    var title: String
    var description: String
    var author: String
}

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

//Team
struct TeamMember {
    var name: String
    var email: String
    var phone: String
}

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
    ),
    TeamMember(
        name: "Rafa",
        email: "rafacarrillo@gmail.com",
        phone: "298322311"
    )
]

//Strings: Project

struct ProjStrings {
    var sTitle: String
    var sTitle2: String
    var cellIdentifier: String
}

let pString = ProjStrings(sTitle: "Tickets", sTitle2: "Team", cellIdentifier: "projCell")



//func numberOfSections(in tableView: UITableView) -> Int {
  //   return 2
// }

// func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
 //    return section == 0 ? pString.sTitle : pString.sTitle2
// }


//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return section == 0 ?  tickets.count : team.count
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tv.dequeueReusableCell(withIdentifier: pString.cellIdentifier, for: indexPath)
//    let ticket = tickets[indexPath.row]
//    //aca deberia haber un guard let a ver si tiene todo eso
//    cell.textLabel?.text = ticket.title
//    cell.detailTextLabel?.text = ticket.description
//    return cell
//}
