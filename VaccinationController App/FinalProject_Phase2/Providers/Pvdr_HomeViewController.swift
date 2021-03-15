//
//  Pvdr_HomeViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/8/20.
//

import UIKit

class Pvdr_HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func LogOutAction()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        AppDelegate.loginSession = DB_LoginSession(context:context)
        AppDelegate.loginUser = DB_Login(context:context)
        AppDelegate.CurrentProvider = DB_Hospital(context:context)
        AppDelegate.CurrentPatient = DB_Patient(context:context)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController!.pushViewController(nextViewController, animated: true)
        //present(nextViewController, animated:false, completion:nil)
    }
       

    @IBAction func didTabMenuButton()
    {
       print("HO")
      // let vc = storyboard?.instantiateViewController(withIdentifier: "MenuTableTableViewController") as? MenuTableTableViewController
    //   vc!.calledBy = "Provider"
      // self.navigationController.pu
        //  self.navigationController!.pushViewController(vc!, animated: true)
   
        
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

}
