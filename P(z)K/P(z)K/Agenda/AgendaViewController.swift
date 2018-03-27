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
    
    
    
    var appointments : [Appointment] = [Appointment]()
    let appointmentDAO = CoreDataDAOFactory.getInstance().getAppointmentDAO()
    var appointmentsList : [String] = [String]()
    var appointmentsCalendarList : [Date] = [Date]()
    
    var treatments : [Treatment] = [Treatment]()
    let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()
    var treatmentsMedicsList : [String] = [String]()
     var treatmentsDosesList : [String] = [String]()
     var treatmentsQuantityDoseList : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.dataSource = self
        tableView.delegate = self
   
        
        tableView1.dataSource = self
        tableView1.delegate = self
      
        
        
        controlleur(0)
        
        loadData()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        var count:Int?
        
        if tableView == self.tableView {
            count = appointmentsList.count
        }
        
        if tableView == self.tableView1 {
            count = treatmentsMedicsList.count
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
            
            if(appointmentsList != []){
                cellRdv?.doctorName.text = "Dr " + appointmentsList[indexPath.row]
                cellRdv?.date.text = appointmentsCalendarList[indexPath.row].description
            }
            cell = cellRdv
        }
        
        
        if tableView == self.tableView1 {
            
            
            cellMedics = (tableView.dequeueReusableCell(withIdentifier: "medicCell", for: indexPath as IndexPath) as! AgendaMedicTableCell)
            
            if(treatmentsMedicsList != []){
                cellMedics?.MedicName.text = treatmentsMedicsList[indexPath.row]
                cellMedics?.MedicDose.text = treatmentsDosesList[indexPath.row] + " fois par jour"
                cellMedics?.MedicPrises.text = treatmentsQuantityDoseList[indexPath.row]
            }
            
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
    
    func loadData(){
        do{
            treatments = try treatmentDAO.getAll() as! [Treatment]
            
            
            for _ in (treatments){
                treatmentsMedicsList.append(treatments.first?.medecine as! String)
                treatmentsDosesList.append(treatments.first?.doseHoursPerDay as! String)
                treatmentsQuantityDoseList.append(treatments.first?.quantityPerDose as! String)
                
                treatments.removeFirst()
            }
            
            
            
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
        do{
            appointments = try appointmentDAO.getAll() as! [Appointment]
            
            
            for _ in (appointments){
                appointmentsList.append(appointments.first?.doctorLastName as! String)
                appointmentsCalendarList.append(appointments.first?.appointmentDate as! Date)
                appointments.removeFirst()
            }
            
            
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
    @IBAction func unwindToAgenda(segue: UIStoryboardSegue){
        
        loadData()
    }
    
    
}
