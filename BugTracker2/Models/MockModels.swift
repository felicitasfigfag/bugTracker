//
//  Models.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 15.08.22.
//
import Foundation

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


