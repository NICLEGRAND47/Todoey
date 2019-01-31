//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Nicolas Fournier on 2019-01-31.
//  Copyright © 2019 Nicolas Fournier. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray: [Category] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    //MARK - TableView Datasources Methods

    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error: While fetching the categories : \(error)")
        }
        tableView.reloadData()
    }
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error: While saving categories : \(error)")
        }
        tableView.reloadData()
    }
    
    //MARK - Data Manipulation Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    //MARK - Add new Category

    @IBAction func addCategoryButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert: UIAlertController = UIAlertController(title: "Add a Category", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            textField = alertTextField
            alertTextField.placeholder = "Create a Category"
        }
        
        let alertAction: UIAlertAction = UIAlertAction(title: "Add", style: .default) {
            (action) in
            
            let category = Category(context: self.context)
            category.name = textField.text!
            
            self.categoryArray.append(category)
            
            self.saveCategories()
            
            self.tableView.reloadData()
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK - Delegate table view methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = self.categoryArray[indexPath.row]
        }
    }
}
