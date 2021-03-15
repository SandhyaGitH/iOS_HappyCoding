//
//  Pvdr_InventoryCheckViewController.swift
//  FinalProject_Phase1


import UIKit

class Pvdr_InventoryCheckViewController: UIViewController {

    @IBOutlet weak var namelbl: UILabel!
    var providerName = ""
    @IBOutlet weak var VacineCountlbl: UILabel!
    //var provider:
    @IBOutlet weak var maksCount: UILabel!
    @IBOutlet weak var ppeKitCountlbl: UILabel!
    @IBOutlet weak var textKitCountlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        getAllInventoryItems()
    }
    @IBAction func MenuBtnTapped(_ sender: Any) {
        let vc = MenuViewController(nibName: "MenuViewController", bundle: nil)
        vc.calledBy = "Provider"
         
        
        let transition:CATransition = CATransition()
               transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromLeft
        
       // transition.fillMode = CAMediaTimingFillMode.
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        
        self.navigationController!.pushViewController(vc, animated: false)
        
    }
func getAllInventoryItems()
{
    // call DB inventory of this provider
    // show
    
    namelbl.text = AppDelegate.CurrentProvider?.hospitalName
    
    //let dth = DBHandler()
    let invent = AppDelegate.CurrentProvider?.inventoryR
    print(invent?.covidVaccine)
    if let inventory = AppDelegate.CurrentProvider?.inventoryR
    {
        
        if(inventory.covidVaccine < 1 )
        { VacineCountlbl.text = "Out Of Stock" }
        else
        {
        VacineCountlbl.text = String(inventory.covidVaccine )
        }
        if(inventory.testKit < 1 )
        { textKitCountlbl.text = "Out Of Stock" }
        else
        {
       textKitCountlbl.text = String(inventory.testKit)
        }
        if(inventory.ppeKit < 1 )
        { ppeKitCountlbl.text = "Out Of Stock" }
        else
        {
       ppeKitCountlbl.text =   String(inventory.ppeKit)
        }
        if(inventory.n95Masks < 1 )
        { maksCount.text = "Out Of Stock" }
        else
        {
       maksCount.text =  String(inventory.n95Masks)
        }
    }
   /* let FilterData = inventories.filter { (invent: DB_Inventory) -> Bool in
         do {
            
            return invent.provider?.providerID == AppDelegate.CurrentProvider?.providerID
         }}
     if(FilterData.count > 1)
     {
        VacineCountlbl.text = String(FilterData.last?.covidVaccine ?? 0)
        textKitCountlbl.text = String(FilterData.last?.testKit ?? 0)
        ppeKitCountlbl.text = String(FilterData.last?.ppeKit ?? 0)
        maksCount.text = String(FilterData.last?.n95Masks ?? 0)
     } */
    
}
   

}
