//
//  MatchesTableViewController.swift
//  AmericupIOS
//
//  Created by German Rivera P on 7/21/19.
//  Copyright © 2019 Santiago Muñoz. All rights reserved.
//

import UIKit

class MatchesTableViewController: UITableViewController {
    
    var matchesManager:MatchesManager = MatchesManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let match = matchesManager.getMatch(at:indexPath.row)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.t1 = match.equipo1
        cell.fl1 = match.flag1
        cell.sc1 = match.score1
        cell.sc2 = match.score2
        cell.t2 = match.equipo2
        cell.fl2 = match.flag2
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows according to matches list size
        return matchesManager.matchCount
    }
    /*func dismissMe() {
        dismiss(animated: true, completion: nil)
    }
    
     */
    // Prepare the segue before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow,
            /*Unwrap a reference to the destination view controller; as you’ve created the segue directly
             to the book view controller, it will be the destination view controller*/
            let matchViewController = segue.destination
                as? MatchViewController {
            
            //Editing a book
            //TableViewController pass a Book object to BookViewController
            matchViewController.match =
                matchesManager.getMatch(at: selectedIndexPath.row)
            /*Now you have a reference to the BookViewController, and the BooksTableViewController
             can set itself as its delegate.*/
            matchViewController.delegate = self
            
            /*Because the BookViewController is embedded in a navigation controller, the segue’s destinationViewController
             will be a navigation controller. The destinationViewController property is a UIViewController type,
             so you’ll need to downcast it to a UINavigationController.*/
        } else if let navController = segue.destination
            as? UINavigationController,
            
            /*Now that you have a reference to the navigation controller, you can get a reference to its root view
             controller. You can get a navigation controller’s root view controller with the topViewController property.
             Because this returns a UIViewController object, you’ll need to downcast it to a BookViewController.*/
            let matchViewController = navController.topViewController
                as? MatchViewController {
            
            //Adding a Book
            /*Now you have a reference to the BookViewController, and the BooksTableViewController
             can set itself as its delegate.*/
            matchViewController.delegate = self
        }
    }
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the book from the array
            matchesManager.removeMatch(at: indexPath.row)
            //Delete the book from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

//Defines an extension implement the BookViewControllerDelegate protocol
extension MatchesTableViewController:MatchViewControllerDelegate {
    
    /*Gives an implementation to saveBook method using the addBook BooksManager method
     When the navigation from BookViewController is complete it loads the Book data from
     previous scene in the Books Manager and refresh the table information*/
    func saveMatch(_ match:Match) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Update book
            matchesManager.updateMatch(at: selectedIndexPath.row, with: match)
            //else ... user is adding a Book
        } else {
            // Add book
            matchesManager.addMatch(match)
        }
        tableView.reloadData()
    }
}
