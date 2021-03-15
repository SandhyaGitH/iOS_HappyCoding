//
//  Pvdr_RequestedInventoriesViewController.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/12/20.
//

import UIKit

class Pvdr_RequestedInventoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "InventoryRequestsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
 
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


   

}
extension Pvdr_RequestedInventoriesViewController : UITableViewDelegate
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
extension Pvdr_RequestedInventoriesViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0//MenuItems.count;
     return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? InventoryRequestsTableViewCell  else {
                   fatalError("The dequeued cell is not an instance of MenuTableViewCell.")
               }
        
      //  cell.menuName.text = MenuItems[indexPath.row]
    
       // cell.menuTittleBtn.tag = indexPath.row
       // cell.menuTittleBtn.setTitle(MenuItems[indexPath.row], for: cell.menuTittleBtn.state)
      //  currentTitle = MenuItems[indexPath.row]
      //  cell.menuTittleBtn.addTarget(self, action:#selector(GotoNextView), for: .touchDown)
        
         return cell
        
    }
    @IBAction func MenuBtnTapped(_ sender: Any) {
        let vc = MenuViewController(nibName: "MenuViewController", bundle: nil)
        vc.calledBy = "Provider"
         
        
        let transition:CATransition = CATransition()
               transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
               self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController!.pushViewController(vc, animated: false)
        
    }
    @objc func GotoNextView(sender:UIButton)
     {
        print("menubutton click \(sender.currentTitle)")
        if let menuName = sender.currentTitle {
            if(menuName == "Request Inventory")
            {
                let vc = RequestInventoryItemViewController(nibName: "RequestInventoryItemViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
            }
            else if(menuName == "Check Inventory")
            {
                let vc = Pvdr_InventoryCheckViewController(nibName: "Pvdr_InventoryCheckViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
            }
        }
        
        
     }
    
}
