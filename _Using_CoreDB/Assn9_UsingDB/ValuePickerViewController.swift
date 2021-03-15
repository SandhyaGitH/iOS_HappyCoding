//
//  ValuePickerViewController.swift
//  UsingSB
//
//
//

import UIKit

class ValuePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    

    @IBOutlet  var picker: UIPickerView!
    var SelectedValue = "Search By ProdID"
    //var pickerData: [Customer] = [Customer]()
    var pickerData = ["Search By ProdID","Search By Dept ID","Search By Cat ID"]
    var CustData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
      //  pickerData = AppDelegate.inventOrg.customers
        // Do any additional setup after loading the view.
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
           return pickerData.count
       }
       
       // The data to return fopr the row and component (column) that's being passed in
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String? {
        return String(pickerData[row])
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //AppDelegate.inventOrg.nCustomer = AppDelegate.inventOrg.customers.FindProfile(pickerData[row])
        SelectedValue = pickerData[row]
    }
    
   // selectedO

}
