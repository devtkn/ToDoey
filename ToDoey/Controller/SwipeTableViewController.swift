//
//  SwipeTableViewController.swift
//  ToDoey
//
//  Created by Thomas Krentz on 10.03.19.
//  Copyright © 2019 Thomas Krentz. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //tableview - datasource methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell

        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
                guard orientation == .right else { return nil }
        
                let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                    // handle action by updating model with deletion
                    self.updateModel(at: indexPath)
    
                }
        
                // customize the action appearance
                deleteAction.image = UIImage(named: "delete-icon")
        
                return [deleteAction]
            }
    

    

    // MARK: - Table view data source
    
    func updateModel(at indexPath: IndexPath){
        
    }
}
