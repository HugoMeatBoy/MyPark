//
//  AgendaViewController.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 12/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var controlled: UISegmentedControl!
    
    
    @IBOutlet weak var rdvTable: UITableView!
  
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if(controlled.selectedSegmentIndex == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "rdvCell", for: indexPath) as! AgendaRdvTableCell
            
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "medicCell", for: indexPath) as! AgendaMedicTableCell
        }
        /*
        let fruitName = fruits[indexPath.row]
        cell.label?.text = fruitName
        cell.fruitImageView?.image = UIImage(named: fruitName)
        */
        
        return cell
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
