//
//  CustViewController.swift
//  UsingSB
//
//  Created by Samarth chaturvedi on 11/17/20.
//

import UIKit

class CustViewController: UIViewController {

    var uiCreation = UICreation()
    
   // @IBOutlet var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    //    tableview.delegate = self
     //   tableview.dataSource = self
       
       
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var CustLN: UITextField!
    @IBOutlet weak var CustAddBtn: UIButton!
   
    @IBOutlet weak var CustFN: UITextField!
    @IBOutlet weak var CustAddress: UITextField!
    
    @IBOutlet weak var CustEmail: UITextField!
    
    @IBOutlet weak var CustPho: UITextField!
    
    @IBAction func CustAdd(_ sender: Any) {
         var h: String = CustFN.text!;
         print(h);
      
        let cust = Customer(CustFN.text!, CustLN.text!, CustAddress.text!, CustEmail.text!, CustPho.text!)
        
        if(AppDelegate.validateinput(cust))
        {
            if(cust.vEmailID.validateEmailId())
            {
                if(cust.vContactDetails.validaPhoneNumber())
                {
                  
                    AppDelegate.AddCustomer(cust)
                    
                    let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                   present(alert, animated: true)
                }
                else
                {
                   
                    let alert =  uiCreation.CreateAlert("Alert","Invalid Pho Number")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                   present(alert, animated: true)
                }
            }
            else
            {
                let alert =  uiCreation.CreateAlert("Alert","Invalid Email Address")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert","First Name and Email can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


