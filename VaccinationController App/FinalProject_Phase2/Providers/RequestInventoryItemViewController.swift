//
//  RequestInventoryItemViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/8/20.
//

import UIKit

class RequestInventoryItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet  weak var ItemtextField :UITextField!
    @IBOutlet  weak var Quantity :UITextField!
    @IBOutlet  weak var SaveBtn :UIButton!
    let ItemType = ["Select Item Type","Covid19 Vaccine","PPE  Kit","N95Masks", "Covid19 Test Kit"]
    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.isNavigationBarHidden = false
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
       
        ItemtextField.inputView = pickerView
        ItemtextField.textAlignment = .center
        ItemtextField.placeholder = "Select Item Type"
   
    }
    
    @IBAction func SaveAction()
    {
        if(  ItemtextField.text == "" ||  Quantity.text == "" )
        {
            let alert = UIAlertController(title: "Alert", message: "Please Fill the details", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
       
       let result =  appDelegate.RequestInventory(ItemtextField.text!, Quantity.text!)
        if( result == true)
        {
            let alert = UIAlertController(title: "Alert", message: "Request created", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
      // save into db get and show all inventory request with status in table
       // let loginSession = DbHanlet.Add(loginuser)
      //  AppDelegate.loginUser = loginuser
       //AppDelegate.loginSession = loginSession
        
        
        
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ItemType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ItemType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ItemtextField.text = ItemType[row]
        ItemtextField.resignFirstResponder()
    }
    
}
