//
//  CoachSportifViewController.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoachSportifViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var activities : [Activity] = [Activity]()
    let activityDAO = CoreDataDAOFactory.getInstance().getActivityDAO()
    
    var activitesNameTab: [String] = [String]()
    
    @IBOutlet weak var activitiesTable: UITableView!
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitesNameTab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : TableViewCellActivity?
        cell = (tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath as IndexPath) as! TableViewCellActivity)
        
        if(activitesNameTab != []){
        cell?.activityName.text = activitesNameTab[indexPath.row]
        }
        
        return cell!
    }
    
    
    @IBOutlet weak var AddActivity: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activitiesTable.delegate = self
        activitiesTable.dataSource = self
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
            (action, indexPath) in
            // delete item at indexPath
            /*
             self.doctors.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
             print(self.doctors)*/
            
            self.activityDAO.delete(obj: self.activities[indexPath.row])
            do {
                try self.activityDAO.save()
            } catch {
                fatalError("Erreur à la suppression du médecin.")
            }
            self.activities.remove(at: indexPath.row)
        }
        
        return [delete]
    }
    
    func loadData(){
        do{
            activities = try activityDAO.getAll() as! [Activity]
            var activitiesP = activities
            
            if(activitiesP != []){
                for _ in (activitiesP){
                    
                    if(activitiesP.first?.activityName != nil){
                        
                        let type: String = (activitiesP.first?.activityName)!
                        
                        activitesNameTab.append(type)
                        activitiesP.removeFirst()
                        
                        activitiesP.first?.activityName
                        
                    }
                }
            }
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
    }
    
    @IBAction func unwindToActivities(segue: UIStoryboardSegue){
        
        loadData()
    }
    
}
