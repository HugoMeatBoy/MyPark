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
    var appointmentsCalendarList : [String] = [String]()
    
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
    
  
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
            (action, indexPath) in
            // delete item at indexPath
            
            if tableView == self.tableView{
                
                self.appointmentDAO.delete(obj: self.appointments[indexPath.row])
                do {
                    try self.appointmentDAO.save()
                } catch {
                    fatalError("Erreur à la suppression du rendez-vous.")
                }
                self.appointments.remove(at: indexPath.row)
                
             
            }else{
                
                self.treatmentDAO.delete(obj: self.treatments[indexPath.row])
                do {
                    try self.treatmentDAO.save()
                } catch {
                    fatalError("Erreur à la suppression du rendez-vous.")
                }
                self.treatments.remove(at: indexPath.row)
               
            }
            self.reload()
        }
        
        return [delete]
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
            var treatmentsTmp = treatments
            
            for _ in (treatmentsTmp){
                treatmentsMedicsList.append(treatmentsTmp.first?.medecine as! String)
                treatmentsDosesList.append(treatmentsTmp.first?.doseHoursPerDay as! String)
                treatmentsQuantityDoseList.append(treatmentsTmp.first?.quantityPerDose as! String)
                
                treatmentsTmp.removeFirst()
            }
            
            
            
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
        do{
            
            appointments = try appointmentDAO.getAll() as! [Appointment]
            var appointmentsTmp = appointments
            
            for _ in (appointmentsTmp){
                appointmentsList.append(appointmentsTmp.first?.doctorLastName as! String)
                
                let date = appointmentsTmp.first?.appointmentDate as! Date
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy hh:mm"
              
                appointmentsCalendarList.append(formatter.string(from: date))
                appointmentsTmp.removeFirst()
            }
            
            
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
    }
    
    func reload(){
        appointmentsList.removeAll()
        appointmentsCalendarList.removeAll()
        treatmentsMedicsList.removeAll()
        treatmentsDosesList.removeAll()
        treatmentsQuantityDoseList.removeAll()
        
        self.viewDidLoad()
        
        tableView.reloadData()
        tableView1.reloadData()
    }
    
    @IBAction func unwindToAgenda(segue: UIStoryboardSegue){
        appointmentsList.removeAll()
        appointmentsCalendarList.removeAll()
        treatmentsMedicsList.removeAll()
        treatmentsDosesList.removeAll()
        treatmentsQuantityDoseList.removeAll()
        
        self.viewDidLoad()
        
        tableView.reloadData()
        tableView1.reloadData()
        
    }
    
    
}
