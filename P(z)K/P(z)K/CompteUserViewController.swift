//
//  CompteUserViewController.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CompteUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
 
    
    
    var doctors : [Doctor] = [Doctor]()
    let doctorDAO = CoreDataDAOFactory.getInstance().getDoctorDAO()
    var doctorsNameTab: [String] = [String]()
    var doctorsNumTab: [String] = [String]()
    
    @IBOutlet weak var DoctorsTable: UITableView!
    
    @IBAction func AddDoctor(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoctorsTable.dataSource = self
        DoctorsTable.delegate = self
        
        loadData()
        
    }
        
    func loadData(){
        do{
            doctors = try doctorDAO.getAll() as! [Doctor]
            var doctorsP = doctors
            
            for _ in (doctors){
                doctorsNameTab.append(doctorsP.first?.doctorLastName as! String)
                doctorsNumTab.append(doctorsP.first?.doctorNumTel as! String)
                
                doctorsP.removeFirst()
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
        return doctorsNameTab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : TableViewCellDoctor
        
        cell = (tableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath as IndexPath) as! TableViewCellDoctor)
        
        if(doctorsNameTab != []){
            cell.doctorName.text = doctorsNameTab[indexPath.row]
            
            cell.doctorPhone.text = doctorsNumTab[indexPath.row]
            
        }
        
        return cell
    }
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.doctors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
    }
    }*/
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
            (action, indexPath) in
            // delete item at indexPath
            /*
            self.doctors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(self.doctors)*/
            
            self.doctorDAO.delete(obj: self.doctors[indexPath.row])
            do {
                try self.doctorDAO.save()
            } catch {
                fatalError("Erreur à la suppression du médecin.")
            }
            self.doctors.remove(at: indexPath.row)
        }
        
        return [delete]
    }
    
    @IBAction func unwindToUserAccount(segue: UIStoryboardSegue){
        doctorsNameTab.removeAll()
        doctorsNumTab.removeAll()
        
        self.viewDidLoad()
        
        
        DoctorsTable.reloadData()
        
       
        
    }

}
