//
//  ProductTableViewController.swift
//  assignment-7
//


import UIKit

class ProductTableViewController: UITableViewController {
      @IBOutlet weak var productTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "storecell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
         return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         
        
              return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storecell", for: indexPath) as? ProductTableViewCell  else {
                   fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
               }

        // Configure the cell...
        
        
        return cell
    }

   override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           }
           

    
    
}
