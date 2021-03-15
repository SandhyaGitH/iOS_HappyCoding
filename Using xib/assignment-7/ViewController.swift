//
//  ViewController.swift
//  assignment-7
//
//  Created by Mahak Singh on 11/16/20.
//  Copyright © 2020 Mahak Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    
    @IBAction func addProduct(_ sender: Any) {
       
       // let vc = ProductTableViewController(nibName: "ProductTableViewController", bundle: nil)
     //  vc.CallingParend =
       
    }
    
    @IBAction func CallSearch(_ sender: Any) {
        CallSubMenu("Search")
    }
    @IBAction func CallCustomerSbMenu(_ sender: Any) {
        CallSubMenu("Customer")
    }
    
    @IBAction func CallOrderSbMenu(_ sender: Any) {
        CallSubMenu("Order")
    }
    @IBAction func CallProductSbMenu(_ sender: Any) {
        CallSubMenu("Product")
    }
    
    func CallSubMenu(_ Parent:String)
    {
        
      if(Parent == "Customer")
      { let vc = CommonTableViewController(nibName: "CommonTableViewController", bundle: nil)
        
         vc.CallingParend = Parent
        self.navigationController!.pushViewController(vc, animated: true)
      }
      else  if(Parent == "Product")
        {
        let vc = CommonTableViewController(nibName: "CommonTableViewController", bundle: nil)
          
        //let vc = ProductViewController(nibName: "ProductViewController", bundle: nil)
          vc.CallingParend = Parent
          self.navigationController!.pushViewController(vc, animated: true)
        }
      else  if(Parent == "Search")
        {
        let vc = SearchProductsViewController(nibName: "SearchProductsViewController", bundle: nil)
          
        //let vc = ProductViewController(nibName: "ProductViewController", bundle: nil)
         // vc.CallingParend = Parent
        
          self.navigationController!.pushViewController(vc, animated: true)
        }
        else  if(Parent == "Order")
        { let vc = CustOrderHistoryTableViewController(nibName: "CustOrderHistoryTableViewController", bundle: nil)
          
       //    vc.CallingParend = Parent
          self.navigationController!.pushViewController(vc, animated: true)
        }
        
       
    }
    
    
    
   /* @IBAction func addProduct(_ sender: Any) {
        let vc = ProductTableViewController(nibName: "ProductTableViewController", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func addProduct(_ sender: Any) {
        let vc = ProductTableViewController(nibName: "ProductTableViewController", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func addProduct(_ sender: Any) {
        let vc = ProductTableViewController(nibName: "ProductTableViewController", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
    }
 */
    
}

