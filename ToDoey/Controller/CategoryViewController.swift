//
//  CategoryViewController.swift
//  ToDoey
//
//  Created by Thomas Krentz on 09.03.19.
//  Copyright © 2019 Thomas Krentz. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: SwipeTableViewController {
    
    var categories : Results<Category>?
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        loadCategories()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            
            
            let newCategory = Category()
            newCategory.name = textField.text!
            //newItem.done = false
                        
            self.saveCategories(category: newCategory)
            
            
        }
        
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Hier gib!!"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK - Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count  ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added"
        
        return cell
    }
    
    //MARK - Data Manipulation Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        

        performSegue(withIdentifier: "goToItems", sender: self)
        
        print("Category: didselectRow")
        
        tableView.deselectRow(at: indexPath, animated: true)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            let destinationVC = segue.destination as! TodoListViewController
            
            if let indexpath = tableView.indexPathForSelectedRow {
               destinationVC.selectedCategory = categories?[indexpath.row]
            }
               
        }
    }
    
    func loadCategories(){
        
       categories = realm.objects(Category.self)
        tableView.reloadData()
       
    }
    
    func saveCategories(category: Category){
        
        do {
            try realm.write {
                realm.add(category)
            }
        }
        catch {
            print("Error Saving Context\(error)")
            
        }
        tableView.reloadData()
        
    }
    
//MARK - Delete Data from swipe
    
    override func updateModel(at indexPath: IndexPath) {
        
        if let item = self.categories?[indexPath.row]{
                        do {
                            try self.realm.write {
                                self.realm.delete(item)
                            }
                        }
                        catch {
                            print("Error delete Category: \(error)")
                        }
                    }
        tableView.reloadData()
        
    }
    
}
