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
    
    var activites : [Activity] = [Activity]()
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
        
        do{
            activites = try activityDAO.getAll() as! [Activity]
            
            if(activites != []){
                for _ in (activites){
                    
                    if(activites.first?.activityName != nil){
                        
                        let type: String = (activites.first?.activityName)!
                        
                        activitesNameTab.append(type)
                        activites.removeFirst()
                        
                        activites.first?.activityName
                        
                    }
                }
            }
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
