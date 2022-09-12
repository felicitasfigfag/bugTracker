//
//  TicketsViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 09.09.22.
//

import UIKit

class TicketsViewController: UIViewController {

    @IBOutlet var tv : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tickets"
        tv.dataSource = self
        tv.delegate = self
        //self.tv.rowHeight = 100.0
    }
    

}

extension TicketsViewController : UITableViewDelegate {
    
}

extension TicketsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ticket = tickets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath)
        cell.textLabel?.text = ticket.title
        cell.detailTextLabel?.text = ticket.description
        return cell
    }
    
    
}
