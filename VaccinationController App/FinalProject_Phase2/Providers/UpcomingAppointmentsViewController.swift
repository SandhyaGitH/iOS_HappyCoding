//
//  UpcomingAppointmentsViewController.swift
//  FinalProject_Phase1
//

import UIKit

class UpcomingAppointmentsViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var providerNamelbl: UILabel!
    var appointmentsArr:[DB_Appoinment]?
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "AppointmentTblViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
       BindAppoinments()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        providerNamelbl.text = AppDelegate.CurrentProvider?.hospitalName
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

func BindAppoinments()
{
    let reqs = appDelegate.upcomingAppointments()
    appointmentsArr = [DB_Appoinment]()
     for req in reqs {
        appointmentsArr?.append(req)
     }
    
}
}
extension UpcomingAppointmentsViewController :UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
       // Selectedprod = dataScourceArr[indexPath.row] as EProduct
       // SelectedItemID = "1"
    
        print("you tapped me")
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         //  let  prod = dataScourceArr[indexPath.row] as EProduct
            
            /*    if(CallingParend == "Product")
            {
                var  prod=Product()
                prod = AppDelegate.inventOrg.products[indexPath.row] as Product
               AppDelegate.inventOrg.nProduct = prod
                prod.Delete(AppDelegate.inventOrg)
            }
 */
            // Delete the row from the data source
           // tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}

extension UpcomingAppointmentsViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
       if let count = appointmentsArr?.count
        {
            return  count
        }
        else
        { return 0 } 
       // return 0;
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AppointmentTblViewCell  else {
                   fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
               }
        
        let Formatter = DateFormatter()
        Formatter.dateStyle = .medium
        Formatter.timeStyle = .medium
        
        cell.DateTime.text = "Date: " + Formatter.string(from: (appointmentsArr?[indexPath.row].appointmentDate)!)
       
        cell.PatientName.text = "Name: " + (appointmentsArr?[indexPath.row].patient?.name)!
        cell.patientObj = appointmentsArr?[indexPath.row].patient
        
       if let img =   cell.patientObj?.image
       {
        cell.ImageView.image = UIImage(data: img)
       }
       // cell.ImageView
       // cell.ImageView.layer.cornerRadius = 10 // change this number to get the corners you want
       // cell.ImageView.layer.masksToBounds = true
        return cell
    }
    
    
}
