//
//  SignUpViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/8/20.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource , UITextFieldDelegate{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    // let context
    @IBOutlet weak var PhoneTextField: UITextField!
    
    @IBOutlet weak var PassowrdTextField: UITextField!
    
    
    @IBOutlet weak var SignupBtn: UIButton!
    
    @IBOutlet weak var DropDownTextField: UITextField!
    
    let UserType = ["Patient","Provider","Controller","Patient","Provider","Controller"]
    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = false
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        DropDownTextField.inputView = pickerView
        DropDownTextField.textAlignment = .center
        DropDownTextField.placeholder = "Select User Type"
        self.PhoneTextField.delegate = self
        PhoneTextField.resignFirstResponder()
      //  self.PassowrdTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpAction(_ sender: Any) {
        
        if let usertype = DropDownTextField.text, let pho = PhoneTextField.text, let Pass = PassowrdTextField.text
        {
            if( usertype == "" ||  pho == "" ||  Pass == "")
            {
                let alert = UIAlertController(title: "Alert", message: "Please Fill the details", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
                return
            }
            
            if( !pho.isPhoneNumber)
            {
                let alert = UIAlertController(title: "Alert", message: "Inavlid Phone Number", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
                return
            }
            
            
            let context = appDelegate.persistentContainer.viewContext
            let loginuser = DB_Login(context:context)
          //  let loginuser :DB_Login?
            loginuser.userType = usertype as String
            loginuser.loginID = pho
            loginuser.password = Pass
            let DbHanlet = DBHandler()
            // check if User already exists
            let isExist = appDelegate.DoesUserExist(loginuser)
            if(isExist == true)
            {
                let alert = UIAlertController(title: "Alert", message: "Already Registered", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
                return
            }
            // create login user
            let loginSession = DbHanlet.AddLoginUsers(loginuser)
            AppDelegate.loginUser = loginuser
            AppDelegate.loginSession = loginSession
            
            if(loginuser.userType == "Patient")
            {
               // AppDelegate.CurrentProvider = DB_Hospital(context:context)
                AppDelegate.CurrentPatient = DB_Patient(context:context)
                let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
            }
            else  if(loginuser.userType == "Provider")
            {
                let vc = Pvdr_InformationViewController(nibName: "Pvdr_InformationViewController", bundle: nil)
                vc.updating = false
                self.navigationController!.pushViewController(vc, animated: true)
            }
            else  if(loginuser.userType == "Controller")
            {
                let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
            }
            
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Please Fill the details", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UserType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UserType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DropDownTextField.text = UserType[row]
        DropDownTextField.resignFirstResponder()
    }
    
    /// mask example: `+X (XXX) XXX-XXXX`
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                
                // move numbers iterator to the next index
                index = numbers.index(after: index)
                
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X (XXX) XXX-XXXX", phone: newString)
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
