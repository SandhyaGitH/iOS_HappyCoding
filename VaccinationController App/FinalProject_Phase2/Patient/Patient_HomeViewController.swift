//
//  Patient_HomeViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/8/20.
//

import UIKit

class Patient_HomeViewController: UIViewController  {

    var myAppoinment :DB_Appoinment?
    @IBOutlet weak var appointmentDate: UILabel!
    @IBOutlet weak var appointmentLOcation: UILabel!
    
    @IBOutlet weak var apointmentHeadLineLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        PopulateAppointmentDetails()
        // Do any additional setup after loading the view.
    }

func PopulateAppointmentDetails()
{
    let dbh  = DBHandler()
    if let currrentpatien = AppDelegate.CurrentPatient {
    myAppoinment = dbh.fetchMyAppoinmentRequest(currrentpatien)
    
    guard let nextappoinment = myAppoinment else { return  }
    let Formatter = DateFormatter()
    Formatter.dateStyle = .medium
    Formatter.timeStyle = .medium
    if let date = nextappoinment.appointmentDate  {
        appointmentDate.text = Formatter.string(from: (date))
        appointmentLOcation.text = nextappoinment.provider?.addressLine1
        apointmentHeadLineLbl.text = "Your Next appoinment"
    }
        else
    {
        appointmentDate.text = ""
        appointmentLOcation.text = ""
        apointmentHeadLineLbl.text = ""
    }
    }
    
 
   // print(  \(myAppoinment?.appointmentDate))
  //  print(  \(myAppoinment?.provider?.hospitalName))
  //  print(  \(myAppoinment?.provider?.addressLine1))
}
    @IBAction func didTabMenuButton()
    {
       print("HO")
      // let vc = storyboard?.instantiateViewController(withIdentifier: "MenuTableTableViewController") as? MenuTableTableViewController
    //   vc!.calledBy = "Provider"
      // self.navigationController.pu
        //  self.navigationController!.pushViewController(vc!, animated: true)
   
        
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
       

   

}
