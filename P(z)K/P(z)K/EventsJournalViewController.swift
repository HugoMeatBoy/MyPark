//
//  EventsJournalViewController.swift
//  P(z)K
//
//  Created by Thais Aurard on 28/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class EventsJournalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var events : [Event] = [Event]()
    let eventDAO = CoreDataDAOFactory.getInstance().getEventDAO()
    var eventsName: [String] = [String]()
    var eventsDate: [String] = [String]()
    
    @IBOutlet weak var eventsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        eventsTable.dataSource = self
        eventsTable.delegate = self
        
        loadData()
    }
    
    func loadData(){
        do{
        
        
        events = try eventDAO.getAll() as! [Event]
        var eventsTmp = events
        
            print(eventsTmp.first?.eventName as Any)
        if(eventsTmp.first?.eventName != nil){
            
            for _ in (eventsTmp){
                
                let test = eventsTmp.first?.eventName
                if(test != nil){
                    eventsName.append(test!)
                    
                    let date = eventsTmp.first?.eventDate! as! Date
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd/MM/yyyy hh:mm"
                    eventsDate.append(formatter.string(from: date))
                    
                    eventsTmp.removeFirst()
                }
                
            }
      
        }
    }catch let error as NSError {
        ManageErrorHelper.alertError(view: self, error: error)
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        
        return eventsName.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:EventsJournalTableCell?
        cell =  (tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath as IndexPath) as! EventsJournalTableCell)
        
        
        if(eventsName != []){
            cell?.eventDate.text = eventsDate[indexPath.row]
            cell?.eventName.text = eventsName[indexPath.row]
        }
        return cell!
    }
        

}
