//
//  ProdHomeViewController.swift
//  UsingSB
//
//  Created by Samarth chaturvedi on 12/10/20.
//

import UIKit

class ProdHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func UpdateAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsForEdit") as? ProdViewForTableController
        
       vc!.callingParent = "ProdHome"
       self.navigationController!.pushViewController(vc!, animated: true)
    }
    
    

}
