//
//  LoginViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/8/20.
//

import UIKit

class LoginViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LoginIdTextField: UITextField!
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
        self.LoginIdTextField.delegate = self
        LoginIdTextField.resignFirstResponder()
        
    }

    @IBAction func LoginAction(_ sender: Any) {
        if(LoginIdTextField.text == "" || PasswordTextField.text == ""
            || DropDownTextField.text == "")
        {
            let alert = UIAlertController(title: "Alert", message: "Please Fill login details", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
        
        if( !LoginIdTextField.text!.isPhoneNumber)
        {
            let alert = UIAlertController(title: "Alert", message: "Inavlid Phone Number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
        let found =    appDelegate.LoginUser(LoginIdTextField.text!, PasswordTextField.text!, DropDownTextField.text!)
        if(found == true)
        {
            
        }
        else{ let alert = UIAlertController(title: "Alert", message: "Login failed ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
        var session =  appDelegate.CreateLoginSession(LoginIdTextField.text!, PasswordTextField.text!, DropDownTextField.text!)
       // print("\(session.isLogin)")
        AppDelegate.loginSession = session
        if(session.isLogin == true)
        {
            if(DropDownTextField.text == "Patient")
            {
                // fetch patient profile
                let dth = DBHandler()
                if let patient =  dth.fetchPatientInformation(session.loginUserR!)
                {
                    AppDelegate.CurrentPatient = patient
                let vc = Patient_HomeViewController(nibName: "Patient_HomeViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
                }
                else
                {
                    let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
                    vc.updating = false
                    self.navigationController!.pushViewController(vc, animated: true)
                }
            }
            else  if(DropDownTextField.text == "Provider")
            {
                // fetch provider information
               let dth = DBHandler()
                let provider =  dth.fetchproviderInformation(session.loginUserR!)
                AppDelegate.CurrentProvider = provider
                let vc = Pvdr_HomeViewController(nibName: "Pvdr_HomeViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
            }
            else  if(DropDownTextField.text == "Controller")
            {
                let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
                self.navigationController!.pushViewController(vc, animated: true)
            }
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

}
