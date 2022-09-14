//
//  TicketsViewController.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 09.09.22.
//

import UIKit
import CoreData

class TicketsViewController: UIViewController {

    @IBOutlet var tv : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tickets"
        tv.dataSource = self
        tv.delegate = self
        
        self.savedData()
        //self.tv.rowHeight = 100.0
    }
    
    func savedData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.managedObjectContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tickets")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context!.fetch(request)
            myTickets = [Ticket]()
            
            for data in result as! [NSManagedObject] {
                let ticketTitle = data.value(forKey: "title") as? String
                let ticketDescription = data.value(forKey: "detail") as? String


                let ticket = Ticket(title: ticketTitle ?? "" ,
                                    detail: ticketDescription ?? "")
                myTickets.append(ticket)
            }
            
            self.tv.reloadData()
            
        } catch {
            print("Falle al obtener info de la BD, \(error), \(error.localizedDescription)")
        }
        
        self.downloadTraks()
        
    }
    
    func downloadTraks() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.managedObjectContext

        RestServiceManager.shared.getToServer(responseType: [Ticket].self, method: .get, endpoint: "Tickets") { status, data in
            myTickets = [Ticket]()
            if let _data = data {
                myTickets = _data
                
                //Usamos CoreData
                if let _context = context {
                    
                    //Eliminar contenido
                    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Tickets")
                    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                    
                    do {
                        try appDelegate.persistentStoreCoordinator?.execute(deleteRequest, with: _context)
                    } catch {
                        print(error)
                    }
                    //FIN eliminar contenido
                    
                    
                    
                    //Agregamos contenido
                    for item in _data {
                        guard let ticketsEntity = NSEntityDescription.insertNewObject(forEntityName: "Tickets", into: _context) as? NSManagedObject else {
                            return
                        }
                        
                        ticketsEntity.setValue(item.title, forKey: "title")
                        ticketsEntity.setValue(item.detail, forKey: "detail")
                        
                        do {
                            try _context.save()
                        } catch {
                            print("No se guardo la info. \(error), \(error.localizedDescription)")
                        }
                    }
                }
                self.tv.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        RestServiceManager.shared.getToServer(responseType: [Ticket].self, method: .get, endpoint: "songs")
        { status, data in
            myTickets = [Ticket]()
            if let _data = data {
                myTickets = _data
            }
        }
    }
}

extension TicketsViewController : UITableViewDelegate {
    
}

extension TicketsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myTickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ticket = myTickets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath)
        cell.textLabel?.text = ticket.title
        cell.detailTextLabel?.text = ticket.detail
        return cell
    }
    
    
}
