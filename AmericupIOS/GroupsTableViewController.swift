//
//  GroupsTableViewController.swift
//  AmericupIOS
//
//  Created by German Rivera P on 7/23/19.
//  Copyright © 2019 Santiago Muñoz. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    @IBAction func toMenu(_ sender: UIBarButtonItem) {
        if presentingViewController != nil {
            // was presented via modal segue
            dismiss(animated: true, completion: nil)
        } else {
            // was pushed onto navigation stack
            navigationController!.popViewController(animated: true)
        }
    }
    
    var gmatchesManager:GmatchesManager = GmatchesManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(GroupCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gmatch = gmatchesManager.getGmatch(at:indexPath.row)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! GroupCell
        cell.t1 = gmatch.equipo1
        cell.fl1 = gmatch.flag1
        cell.t2 = gmatch.equipo2
        cell.fl2 = gmatch.flag2
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows according to matches list size
        return gmatchesManager.gmatchCount
    }
    /*func dismissMe() {
     dismiss(animated: true, completion: nil)
     }
     
     */
    // Prepare the segue before navigation
    
    
}

//Defines an extension implement the BookViewControllerDelegate protocol
