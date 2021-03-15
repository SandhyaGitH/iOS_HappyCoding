//
//  BookAppointmentViewController.swift
//  FinalProject_Phase1


import UIKit

class BookAppointmentViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var Provider:DB_Hospital?
    var patient :DB_Patient?
    var distance : String?
    var DatePicker = UIDatePicker()
    var dtvalue:Date?
    @IBOutlet weak var lblproviderName: UILabel!
    
    @IBOutlet weak var lblProvideraddress: UILabel!
   @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var lbldistance: UILabel!
    @IBOutlet weak var BookBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblproviderName.text = Provider?.hospitalName
        lbldistance.text = "approx \(distance ?? "0") miles away from your location"
        lblProvideraddress.text = Provider?.addressLine1
        if(Provider?.image != nil)
        {
            ImageView.image = UIImage(data: (Provider?.image!)!)
        }
        createDatePicker()
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
    
    @IBAction func BookAction(_ sender: Any) {
        
        guard let pat = AppDelegate.CurrentPatient , let selectedprovider = Provider else {
            let alert = UIAlertController(title: "Alert", message: "Info is Missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
            
        }
        if  DateTextField.text == "" {
            let alert = UIAlertController(title: "Alert", message: "please select appointment date", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
      //  let dt = DateTextField.text.
       // let aptDate:Date = getDate(DateTextField.text!)
        let aptDate = dtvalue!
        print("\(aptDate)")
        let result =  appDelegate.BookAppointment(aptDate,pat, selectedprovider)
            if( result == true)
            {
                let alert = UIAlertController(title: "Alert", message: "Appointment Booked", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
              
              
                let vc = Patient_HomeViewController(nibName: "Patient_HomeViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
                present(alert, animated: true)
                return
            }
            else
            {
                let alert = UIAlertController(title: "Alert", message: "Already Booked.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
                return
            }
    }

    func createDatePicker(){
        DatePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        DatePicker.datePickerMode = .dateAndTime
        //DatePicker.timeZone = .
        let toolBar = UIToolbar()
        toolBar.safeAreaInsets
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(Datepressed))
        toolBar.setItems([doneBtn], animated: true)
        DateTextField.inputAccessoryView = toolBar
        
        DateTextField.inputView = DatePicker
        
        DatePicker.datePickerMode = .dateAndTime
    }
    
    @objc func Datepressed()
    {
       // DateTextBox.text = "\(DatePicker.date)"
        DateTextField.textAlignment = .center
        self.view.endEditing(true)
        let Formatter = DateFormatter()
        Formatter.dateStyle = .medium
        Formatter.timeStyle = .medium
        
        DateTextField.text = Formatter.string(from: DatePicker.date)
        dtvalue = DatePicker.date
    }
    
    func getDate(_ strDate:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: strDate) // replace Date String//
    }

}
