//
//  ProfileViewController.swift
//  FinalProject_Phase1
//


import UIKit
import  CoreLocation
class ProfileViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate , UITextFieldDelegate, UINavigationControllerDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var updating = false
    lazy var geoCoder = CLGeocoder()
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageBtn: UIButton!
    @IBOutlet weak var StateTextField: UITextField!
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var ZipTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var addressLine1TextField: UITextField!
    @IBOutlet weak var SaveBtn: UIButton!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    var lattitude :Double?
    var longitude:Double?
   
    var States = ["Massachusetts","Maine","Vermont","California","Rhode Island","New Hampshire","Connecticut"]
    var pickerType = "State"
    var CityZipCodesDict = [String: String]()
    var Cities:[String] = []
    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        StateTextField.inputView = pickerView
        StateTextField.textAlignment = .center
        StateTextField.placeholder = "Select State "
        StateTextField.resignFirstResponder()
        StateTextField.addTarget(self, action: #selector(StateTextpressed), for: .touchDown)
        CityTextField.addTarget(self, action: #selector(CityEndedFilZip), for: .editingDidEnd)
        ImageBtn.addTarget(self, action:#selector(showPhotoMenu), for: .touchDown)
       
        Populateprofile()
        
       // self.nameTextField.delegate = self
      //  CityTextField.inputView = pickerView
        
    }
    func Populateprofile()
    {
     // let  dth = DBHandler()
    //    dth.fetchproviderInformation(<#T##input: DB_Hospital##DB_Hospital#>)
        let myinformation = AppDelegate.CurrentPatient
       // print(myinformation?.addressLine1)
        StateTextField.text = myinformation?.state
        CityTextField.text = myinformation?.city
        ZipTextField.text = myinformation?.zipCode
        addressLine1TextField.text = myinformation?.addressLine1
        nameTextField.text = myinformation?.name
        ageTextField.text = String(myinformation?.age ?? 0)
        if let img = myinformation?.image {
        ImageView.image = UIImage(data: img)
        }
        
        
        

    }
    @IBAction func didTabMenuButton()
    {
      // print("HO")
    
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
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        // Update View
        //geocodeButton.isHidden = false
        //activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = false
        if let error = error {
            print("Unable to Forward Geocode Address (\(error))")
            let alert = UIAlertController(title: "Alert", message: "Unable to Forward Geocode Address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return

        } else {
            var location: CLLocation?

            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }

            if let location = location {
                let coordinate = location.coordinate
                lattitude = coordinate.latitude ; longitude = coordinate.longitude
                print("\(coordinate.latitude), \(coordinate.longitude)")
                SaveBtn.isHidden = false
                //SaveBtn.isEnabled = true
            } else {
                print( "No Matching Location Found")
            }
        }
    }

    @IBAction func SaveAction(_ sender: Any) {
        
        if(nameTextField.text == "" || ageTextField.text == ""  || addressLine1TextField.text == "" || StateTextField.text == ""
            || CityTextField.text == "" || ZipTextField.text == "")
        {
            let alert = UIAlertController(title: "Alert", message: "Please Fill the details", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let newPatient:DB_Patient?
        if(updating == true )
        {
             newPatient = AppDelegate.CurrentPatient
        }
        else{
             newPatient = DB_Patient(context:context)
        }
       
      //  let newPatient = DB_Patient(context:context)
        newPatient!.name = nameTextField.text
        newPatient!.age = Int16(ageTextField.text!)!
        newPatient!.addressLine1 = addressLine1TextField.text
        newPatient!.state = StateTextField.text
        newPatient!.city = CityTextField.text
        newPatient!.zipCode = ZipTextField.text
        if let imageData = ImageView.image {
            newPatient?.image = imageData.pngData()
           
        }
     
        activityIndicatorView.startAnimating()
       
        let DbHanlet = DBHandler()
        newPatient!.patientID =  Int16(DbHanlet.fetchPatients().count + 1)
        newPatient!.loginUserR = AppDelegate.loginUser
        
        var address = "United States, \(CityTextField.text), \(addressLine1TextField.text)"
    //  address = "1 Central square Eats Boston MA 02128"
        address = addressLine1TextField.text!
       // let placemarks = "1 Central square Eats Boston MA 02128"
          // Geocode Address String
        geoCoder.geocodeAddressString(address) { [self] (placemarks, error) in
              
              self.processResponse(withPlacemarks: placemarks, error: error)
            
           // SaveBtn.isHidden = true
           
        
        //  let DbHanlet = DBHandler()
            newPatient!.lattitude = lattitude!
            newPatient! .longitude = longitude!
            DbHanlet.AddPatients(newPatient!)
           AppDelegate.CurrentPatient = newPatient
            activityIndicatorView.startAnimating()
            let vc = Patient_HomeViewController(nibName: "Patient_HomeViewController", bundle: nil)
              self.navigationController!.pushViewController(vc, animated: true)
          }
       
    }
    
    

    @IBAction func TextBoxSelected(_ sender: Any) {
        States = ["Massachusetts","Maine","Vermont","California","Rhode Island","New Hampshire","Connecticut"]
         pickerType = "State"
        StateTextField.inputView = pickerView
        StateTextField.textAlignment = .center
        StateTextField.placeholder = "Select State "
    }
    
    @IBAction func FillCities(_ sender: Any) {
        pickerType = "City"
        CityTextField.inputView = pickerView
        CityTextField.textAlignment = .center
        CityTextField.placeholder = "Select City "
        CityTextField.resignFirstResponder()
        BindCities()
    }
    
  
    
    @objc func StateTextpressed()
    {
        print("hi")
        States = ["California","Connecticut","Massachusetts","Maine","Vermont","Rhode Island","New Hampshire"]
         pickerType = "State"
        StateTextField.inputView = pickerView
        StateTextField.textAlignment = .center
        StateTextField.placeholder = "Select State "
    }
    
    @objc func CityEndedFilZip()
    {
        print("hi")
        guard let city = CityTextField.text else {
            return
        }
        ZipTextField.text = CityZipCodesDict[city]
        ZipTextField.textAlignment = .center
        //StateTextField.placeholder = "Select State "
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerType ==  "State")
        {return States.count}
        else{
            return Cities.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          if(pickerType ==  "State")
        { return States[row]
            
          }
        else{
            return Cities[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerType ==  "State")
      {  StateTextField.text = States[row]
            StateTextField.resignFirstResponder()
            
        }
      else{
        CityTextField.text = Cities[row]
        CityTextField.resignFirstResponder()
      }
       
    }
    
    
    func BindCities()
    {
     if(StateTextField.text == "Massachusetts")
     {
         Cities = ["Boston","Cambridge","Worcester","Natick", "Framingham", "Lowell" ,"Quincy", "Walthem" ]
        
        CityZipCodesDict = ["Boston":"02128","Cambridge":"02139    ","Worcester":"01604","Natick":" 01760", "Framingham":" 01702" , "Lowell":"01850", "Quincy":"02122","Walthem":"02451" ]
     }
     else if(StateTextField.text == "Maine")
     {
        CityZipCodesDict = ["Portland" : "04101","Lewiston":"04240","Sanford":"03906"]
         Cities = ["Portland","Lewiston" ,"Sanford" ]
     }
     else if(StateTextField.text == "Vermont")
     {
         Cities = ["Bradford", "Woodstock"]
        CityZipCodesDict = ["Bradford" : "05033", "Woodstock" : "05091"]
     }
     else if(StateTextField.text == "California")
     {
         Cities = ["Beverly Hills", "Culver City", "Holly Park"]
        CityZipCodesDict = ["Beverly Hills" : "90209", "Culver City - 90230" : "Holly Park - 90250"]
     }

     
    }
    
 
    func BindZipCodes()
    {
     if(StateTextField.text == "Boston")
     {
         Cities = ["Boston-02128","Cambridge-02139    ","Worcester-01604","Natick - 01760", "Framingham - 01702", "Lowell" ,"Quincy", "Walthem" ]
     }
     else if(StateTextField.text == "Maine")
     {
         Cities = ["Portland","Lewiston" ,"Sanford" ]
     }
     else if(StateTextField.text == "Vermont")
     {
         Cities = ["Bradford - 05033", "Woodstock - 05091"]
     }
     else if(StateTextField.text == "California")
     {
         Cities = ["Beverly Hills - 90209", "Culver City - 90230", "Holly Park - 90250"]
     }

     
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        dismiss(animated: true)
      
        let currentImage = image
        if let imageData = currentImage.pngData() {
            ImageView.image = currentImage
           
        }
        
    }
   /* let actPhoto = UIAlertAction(title: "Take Photo",
          style: .default, handler: { _ in
            self.takePhotoWithCamera();
          })
 
    let actLibrary = UIAlertAction(title: "Choose From Library",
          style: .default, handler: { _ in
            self.choosePhotoFromLibrary();
          }) */
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
      }
    func choosePhotoFromLibrary() {
      let imagePicker = UIImagePickerController()
      imagePicker.sourceType = .photoLibrary
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      present(imagePicker, animated: true, completion: nil)
    }
    
    @objc  func showPhotoMenu(sender : UIButton) {
      let id = sender as? UIButton
   //   selectedProd = AppDelegate.inventOrg.products[id!.tag]
        let alert = UIAlertController(title: nil, message: nil,
                             preferredStyle: .actionSheet)

        let actCancel = UIAlertAction(title: "Cancel", style: .cancel,
                                    handler: nil)
        alert.addAction(actCancel)

        let actPhoto = UIAlertAction(title: "Take Photo",
                                     style: .default, handler: nil)
        alert.addAction(  UIAlertAction(title: "Take Photo",
                                                        style: .default, handler: { _ in
                                                          self.takePhotoWithCamera();
                                                        }))

        let actLibrary = UIAlertAction(title: "Choose From Library",
                                       style: .default, handler: nil)
        alert.addAction(UIAlertAction(title: "Choose From Library",
                                      style: .default, handler: { _ in
                                        self.choosePhotoFromLibrary();
                                      })
        )
          
       present(alert, animated: true, completion: nil)
      }
    
 /*   func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    } */

}