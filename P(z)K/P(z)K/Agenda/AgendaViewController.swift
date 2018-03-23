//
//  AgendaViewController.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 12/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class AgendaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var tableView1: UITableView!
   
    @IBOutlet weak var control: UISegmentedControl!
  
    @IBOutlet weak var AddMedic: UIButton!
    
    @IBOutlet weak var AddRdv: UIButton!
    
    
    
    /// A simple data structure to populate the table view.
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        
        tableView.dataSource = self
        tableView.delegate = self
   
        
        tableView1.dataSource = self
        tableView1.delegate = self
      
        
        
        controlleur(0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        var count:Int?
        
        if tableView == self.tableView {
            count = 3
        }
        
        if tableView == self.tableView1 {
            count =  3
        }
 
        return count!
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        let cellRdv:AgendaRdvTableCell?
        let cellMedics:AgendaMedicTableCell?
        
        if tableView == self.tableView {
            
            cellRdv = (tableView.dequeueReusableCell(withIdentifier: "rdvCell", for: indexPath as IndexPath) as! AgendaRdvTableCell)
   

            
           
            cellRdv?.date.text = "ok"
            
            /*
             TODO here : Charger le core data des rdv
             
             cellRdv?.date.text = "ok"
            */
            cell = cellRdv
        }
        
        
        if tableView == self.tableView1 {
            
            
            cellMedics = (tableView.dequeueReusableCell(withIdentifier: "medicCell", for: indexPath as IndexPath) as! AgendaMedicTableCell)
            
            cell = cellMedics
            
        }
        return cell!
    }
    
  

    
    
    @IBAction func controlleur(_ sender: Any) {
        switch control.selectedSegmentIndex
        {
        case 0:
            tableView.isHidden = false
            tableView1.isHidden = true
            AddMedic.isHidden = true
            AddRdv.isHidden = false
        case 1:
            tableView.isHidden = true
            tableView1.isHidden = false
            AddMedic.isHidden = false
            AddRdv.isHidden = true
        default:
            break
        }
    }
    
    
}
