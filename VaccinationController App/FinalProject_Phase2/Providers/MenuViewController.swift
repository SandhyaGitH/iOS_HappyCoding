//
//  MenuViewController.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/12/20.
//

import UIKit

class MenuViewController: UIViewController {
   
    @IBOutlet var ViewOuter: UIView!
    @IBOutlet weak var tableView: UITableView!
      //  @IBOutlet weak var CellText: UILabel!
      //  @IBOutlet weak var Cellimageview: UIImageView!
       //var calledBy:String = ""
    
        var MenuItems:[String] = []
        var calledBy:String?
        override func viewDidLoad() {
            super.viewDidLoad()

            let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "Cell")
      BindMenuItems()
            
            self.tableView.delegate = self
            self.tableView.dataSource = self
        
                self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
           // self.tableView.visibleCells.
            self.navigationController?.isNavigationBarHidden = true
          //  self.tableView?.tableFooterView = UIView()
            changeBG()
        }

    func changeBG()
    {
        if(calledBy == "Provider")
        {
          
        }
        if(calledBy == "Patient")
        {
            ViewOuter.backgroundColor = UIColor.magenta
            self.tableView.backgroundColor = UIColor.systemPink
           // self.tableView.style.
        }
        if(calledBy == "Controller")
        {
            ViewOuter.backgroundColor = UIColor.systemBlue
        }
        
    }
        // MARK: - Table view data source
    func BindMenuItems()
    {
        if(calledBy == "Provider")
        {
            MenuItems.append("Home")
            MenuItems.append("My Account")
            MenuItems.append("Request Inventory")
            MenuItems.append("Check Inventory")
            MenuItems.append("Upcoming Appointments")
            
            //MenuItems.append("")
        }
        if(calledBy == "Patient")
        {
            MenuItems.append("My Home")
            MenuItems.append("My Profile")
            MenuItems.append("Book Appointment")
            MenuItems.append("My Request")
            //MenuItems.append("")
        }
        if(calledBy == "Controller")
        {
            MenuItems.append("DashBoard")
            MenuItems.append("Show  Providers")
            MenuItems.append("All Requests")
            MenuItems.append("Approval Pending")
            //MenuItems.append("")
        }
        
    }
    
}
    extension MenuViewController : UITableViewDelegate
    {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
            print("you tapped me")
        }
         func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
              
               
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
    }
    extension MenuViewController:UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            var count = MenuItems.count;
         return count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MenuTableViewCell  else {
                       fatalError("The dequeued cell is not an instance of MenuTableViewCell.")
                   }
            
          //  cell.menuName.text = MenuItems[indexPath.row]
        
            cell.menuTittleBtn.tag = indexPath.row
            cell.menuTittleBtn.setTitle(MenuItems[indexPath.row], for: cell.menuTittleBtn.state)
          //  currentTitle = MenuItems[indexPath.row]
            cell.menuTittleBtn.addTarget(self, action:#selector(GotoNextView), for: .touchDown)
            
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
             return cell
            
        }
        
        @objc func GotoNextView(sender:UIButton)
         {
            print("menubutton click \(sender.currentTitle)")
            if let menuName = sender.currentTitle {
                if(menuName == "Upcoming Appointments")
                {
                    let vc = UpcomingAppointmentsViewController(nibName: "UpcomingAppointmentsViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
               else if(menuName == "My Account")
                {
                
                    let vc = Pvdr_InformationViewController(nibName: "Pvdr_InformationViewController", bundle: nil)
                vc.updating = true
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                
              else  if(menuName == "Request Inventory")
                {
                    let vc = RequestInventoryItemViewController(nibName: "RequestInventoryItemViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "Check Inventory")
                {
                    let vc = Pvdr_InventoryCheckViewController(nibName: "Pvdr_InventoryCheckViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "My Profile")
                {
                    let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
                    vc.updating = true
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "Book Appointment")
                {
                   // let vc = BookAppointmentViewController(nibName: "BookAppointmentViewController", bundle: nil)
                    let vc = SearchProvidersViewController(nibName: "SearchProvidersViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "My Request")
                {
                    let vc = Patient_MyRequestViewController(nibName: "Patient_MyRequestViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "Show  Providers")
                {
                    let vc = ProvidersListViewController(nibName: "ProvidersListViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "Approval Pending")
                {
                    let vc = RequestApprovalViewController(nibName: "RequestApprovalViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "All Requests")
                {
                    let vc = AllRequestsViewController(nibName: "AllRequestsViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "My Home")
                {
                    let vc = Patient_HomeViewController(nibName: "Patient_HomeViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "Home")
                {
                    let vc = Pvdr_HomeViewController(nibName: "Pvdr_HomeViewController", bundle: nil)
                    self.navigationController!.pushViewController(vc, animated: true)
                }
                else if(menuName == "DashBoard")
                {
                    let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
                  //  vc.st
                    self.navigationController!.pushViewController(vc, animated: true)
                }
            }
            
            
         }
        
    }
