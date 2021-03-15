//
//  Patient_MyRequestViewController.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/12/20.
//

import UIKit

class Patient_MyRequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func didTabMenuButton()
    {
       print("HO")
    
        let vc = MenuViewController(nibName: "MenuViewController", bundle: nil)
        vc.calledBy = "Patient"
        let transition:CATransition = CATransition()
               transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
               self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController!.pushViewController(vc, animated: false)
      
         // self.navigationController!.pushViewController(vc, animated: true)
    }

}
