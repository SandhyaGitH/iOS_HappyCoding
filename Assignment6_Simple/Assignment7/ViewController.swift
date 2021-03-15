//
//  ViewController.swift
//  Assignment7
//
//  Created by Samarth chaturvedi on 11/14/20.
//

import UIKit

class ViewController: UIViewController {

    var safeArea: UILayoutGuide!
    let tableView = UITableView()
    override func loadView() {
        super.loadView()
        setupTableView()
        safeArea = view.layoutMarginsGuide
          }
    
 
    public var  characters: [String] = []
    
      func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      }
    
   
}
extension ViewController: UITableViewDataSource {
    
   // func ta
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = characters[indexPath.row]
    return cell
  }
}


