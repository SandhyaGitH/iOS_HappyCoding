//
//  ValuePickerViewController.swift
//  UsingSB
//
//
//

import UIKit

class ValuePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    
 let uiCreation = UICreation()
    @IBOutlet weak var DateTextBox: UITextField!
    var DatePicker = UIDatePicker()
    @IBOutlet  var picker: UIPickerView!
    var pickerData: [Customer] = [Customer]()
    var CustData: [String] = [String]()
    var selectedCustomer :Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = AppDelegate.inventOrg.customers
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CallOrderHistory(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustOrderHistoryTableViewController") as! CustOrderHistoryTableViewController
        
    
        let Formatter = DateFormatter()
        Formatter.dateStyle = .medium
        Formatter.timeStyle = .medium
        
        if let selectedcust = selectedCustomer  {
            
        if let date = Formatter.date(from: DateTextBox.text!) {
            nextViewController.DateSelected = date
            nextViewController.customerSelected = selectedcust
            self.present(nextViewController, animated:true, completion:nil)
        }
        else
        {
            let alert =  uiCreation.CreateAlert("Alert","Select the Date First")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
        }
        }
        else{
            let alert =  uiCreation.CreateAlert("Alert","Select the Customer")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
        }
        
        
       // nextViewController.DateSelected = Formatter.date(from: DateTextBo
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
        DateTextBox.inputAccessoryView = toolBar
        
        DateTextBox.inputView = DatePicker
        
        DatePicker.datePickerMode = .dateAndTime
    }
    
    @objc func Datepressed()
    {
       // DateTextBox.text = "\(DatePicker.date)"
        DateTextBox.textAlignment = .center
        self.view.endEditing(true)
        let Formatter = DateFormatter()
        Formatter.dateStyle = .medium
        Formatter.timeStyle = .medium
        
        DateTextBox.text = Formatter.string(from: DatePicker.date)
        
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

       // Number of columns of data
       func numberOfComponents(in pickerView: UIPickerView)->Int {
           return 1
       }
       
    
       // The number of rows of data
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerData.count>0)
        {
            selectedCustomer = pickerData[0]
        }
           return pickerData.count
       }
       
       // The data to return fopr the row and component (column) that's being passed in
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String? {
        return String(pickerData[row].vID)
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        AppDelegate.inventOrg.nCustomer = AppDelegate.inventOrg.customers.FindProfile(String(pickerData[row].vID))
        selectedCustomer = AppDelegate.inventOrg.nCustomer
    }
    
   // selectedO

}
