//
//  TicketsModel.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 09.09.22.
//

import Foundation

struct Ticket: Codable, Hashable {
    var title: String
    var detail: String
}

//let tickets : [Ticket] =
//[Ticket(title: "Ticket number one", description: "This is the first ticket"),
//                        
// Ticket(title: "Ticket number two", description: "This is the second ticket"),
//                          
// Ticket(title: "Ticket number three", description: "This is the third ticket"),
//                          
// Ticket(title: "Ticket number four", description: "This is the last ticket"),
//]

var myTickets = [Ticket]()
