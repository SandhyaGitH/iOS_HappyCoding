//
//  SearchProvidersViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/8/20.
//

import UIKit
import CoreLocation
import MapKit
import Foundation
class SearchProvidersViewController: UIViewController , CLLocationManagerDelegate{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   // var pendingInventoryReq :[Db_InventoryRequest]?
    @IBOutlet weak var tableView: UITableView!
    let request = MKDirections.Request()
    var locationManger:CLLocationManager?
    var currentLocation :CLLocation?
    private let geocoder = CLGeocoder()
    var placemark:String?//= currentLocation?.distance(from: loc2)
    //var placemark : String?
   /* var loc = Slocation(vlattitude: "-41.168740", vLongitude: "174.147130")
    var loc2 = Slocation(vlattitude: "42.358990", vLongitude: "-71.058630")
    var loc3 = Slocation(vlattitude: "26.912643", vLongitude: "-80.261549")
    var location :Array<Slocation>? */
    
    var prviders: [String: Slocation] = [:]//["CVS natick":loc ,"CVS2":loc , "CVS3":loc]
    //var DicsProvider: [[String: Slocation]  :Double]
    var ProviderArr : Array<ResultProviders>?
    var ProviderDBArr : Array<ResultDBProviders>?
    var ProviderList: Array<DB_Hospital>?
    var searching = false
   
    @IBOutlet weak var providerFinderBtn: UIButton!
   
    @IBOutlet weak var Locationlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SerchTableTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "storecell")
       
       //  prviders = ["CVS Natick":loc ,"CVS Boston":loc2 , "Walgreens Natick":loc3]
      
        Bindproviders()
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
    func Bindproviders()
    {
        var Providers = [DB_Hospital]()
       let dth =  DBHandler()
        ProviderList = [DB_Hospital]()
        Providers = dth.fetchProviderss()
       
        ProviderList = Providers.filter { (prov: DB_Hospital) -> Bool in
             do {
                 
                return prov.hospitalName != ""
                    &&
                    prov.addressLine1 != "" && prov.longitude != 0.0
             }}
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //let nib = UINib(nibName: "SerchTableTableViewCell", bundle: nil)
       // tableView.register(nib, forCellReuseIdentifier: "storecell")
        locationManger = CLLocationManager()
        locationManger?.delegate = self
        locationManger?.desiredAccuracy = kCLLocationAccuracyBest
        locationManger?.requestWhenInUseAuthorization()
        locationManger?.startUpdatingLocation()
       // calculateDistance()
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        
        guard let last = locations.last else { return  }
        
        Locationlbl.text = "\(last.coordinate.latitude )| \(last.coordinate.longitude)"
        
        currentLocation = last
        
       // if let latitude =  last.coordinate.latitude, let longitude = last.coordinate.longitude {
            let fromloca:CLLocation = CLLocation(latitude: last.coordinate.latitude, longitude: last.coordinate.longitude)
            let distance:CLLocationDistance = (currentLocation?.distance(from: fromloca))!
            let distamnceinmeters = Double(distance.description) ?? 0
        Locationlbl.text =  "\(distamnceinmeters * 0.000621371)"
        if( distamnceinmeters == 0 )
        { Locationlbl.text =  "Search nearest vaccine center "}
            
           // Locationlbl.text = currentLocation?.
           
      //  }
      /*  if let latitude =  Double("42.283150"), let longitude = Double("-71.375160") {
            let fromloca:CLLocation = CLLocation(latitude: latitude, longitude: longitude)
            let distance:CLLocationDistance = (currentLocation?.distance(from: fromloca))!
            let distamnceinmeters = Double(distance.description) ?? 0
            Locationlbl.text =  "\(distamnceinmeters * 0.000621371)"
            
           // Locationlbl.text = currentLocation?.
           
        } */
        //GetPlaceMark()
    }
    
  func  GetProviderList()
    {
 //   location?.append(loc)
 //   location?.append(loc2)
 //   location?.append(loc3)
    ProviderArr = [ResultProviders]()
    ProviderDBArr = [ResultDBProviders]()
    if let  localprovides =  ProviderList
        { for item in localprovides {
            
          //  if let latitude =  item.lattitude, let longitude = item.longitude {
            let fromloca:CLLocation = CLLocation(latitude: item.lattitude, longitude: item.longitude)
                let distance:CLLocationDistance = (currentLocation?.distance(from: fromloca))!
                let distamnceinmeters = Double(distance.description) ?? 0
                Locationlbl.text =  "nearest is at \(distamnceinmeters * 0.000621371) miles"
                
                let ResultProvider = ResultProviders()
                ResultProvider.distance = Double(Locationlbl.text!) ?? 0
            ResultProvider.PlaceMark = item.hospitalName!
                ProviderArr!.append(ResultProvider)
            let resultDBProviders = ResultDBProviders()
            let disatnce = round(distamnceinmeters * 0.000621371)
            resultDBProviders.distance = disatnce
            resultDBProviders.PlaceMark = item.hospitalName!
            resultDBProviders.provider = item
            resultDBProviders.patient = AppDelegate.CurrentPatient!
            ProviderDBArr!.append(resultDBProviders)
            ProviderDBArr?.sort(by: sortPrvdrByDistance)
            tableView.reloadData()
           // }
            
           // ProviderArr?.sort(by: sortPrvdrByDistance)
        }
    }
    
    for item in ProviderArr! {
        
        print("\(item.distance) -- \(item.PlaceMark)")
    }
    
   
    }
    
    @IBAction func FindProviderAction(_ sender: Any) {
        searching = true
        GetProviderList()
      /*  calculateDistance{ [self](Response) in
           var g = calcultetime(Response.Ditance!, String(Response.Time!))
           print(g)
          }
        }*/
    
    }
    func   calculateDistance(completionHandler: @escaping (Response)->Void)
 {  //  _ p1 :CLLocation,_ p2 :CLLocation
       
        if let latitude =  currentLocation?.coordinate.latitude, let longitude = currentLocation?.coordinate.longitude{
    let A:CLLocation = CLLocation(latitude: latitude, longitude: longitude)
            
        if let latitude =  Double("26.912643"), let longitude = Double("-80.261549") {
        let B:CLLocation = CLLocation(latitude: latitude, longitude: longitude)
 
       let sourceP         = CLLocationCoordinate2DMake(A.coordinate.latitude, A.coordinate.longitude)
        let destP           = CLLocationCoordinate2DMake(B.coordinate.latitude, B.coordinate.longitude)
        let source          = MKPlacemark(coordinate: sourceP)
        let destination     = MKPlacemark(coordinate: destP)
        request.source      = MKMapItem(placemark: source)
        request.destination = MKMapItem(placemark: destination)
        
        // Specify the transportation type
        request.transportType = MKDirectionsTransportType.automobile;
        
       request.requestsAlternateRoutes = false
        
        let directions = MKDirections(request: request)
         directions.calculate { [self] (response, error) in
            if let response = response, let route = response.routes.first {
                let seconds = route.expectedTravelTime
               // var time = ""//(route.expectedTravelTime/3600)
                var result:Response?
               // guard let res = route else { return  }
                
                result?.Time = route.expectedTravelTime
                result?.Ditance = route.distance
             //   completionHandler(result!)
                DispatchQueue.main.async {
                   
                }
               // let time = calcultetime(seconds,"")
            
                print("\(route.distance) ---\(time) ---\(route.distance  * 0.000621371)") // You could have this returned in an async approach
            }
        }
 }

        }
        
    }
    
    func calcultetime(_ seconds: Double, _ Time:String)->String
    {
       var time:String = Time
        var remainder = 0
        if(seconds <= 0)
          { return time}
            
            if(seconds>=86400)
            {
                time = time +  "\(Int(seconds)/86400) Days"
                 remainder = Int(seconds) % (86400)
               
            }
            else if(seconds>=3600)
            {
                time = time + "\(seconds/3600) Hours"
                 remainder = Int(seconds) % (86400)
            }
            else if(seconds>=60)
            {
                time = time + "\(seconds/60) Minutes"
                 remainder = Int(seconds) % (86400)
            }
            else
            {
                time = time + "\(seconds) Seconds"
                 remainder = Int(seconds) % (86400)
            }
        
        if(remainder > 0)
        {
            calcultetime(Double(remainder ),time)
        }
        return time
    }
    
     func GetPlaceMark(_ Location:CLLocation?) {
        guard let location = Location else { return }
        geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
          if error == nil {
           // self.placemark = String(places?[0])
            print(places?.first)
            return
          } else {
            //self.placemark = ""
          }
        })
      }

    func sortPrvdrByDistance(this:ResultDBProviders, that:ResultDBProviders) -> Bool {
        return this.distance < that.distance
    }
}
extension SearchProvidersViewController :UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
       // Selectedprod = dataScourceArr[indexPath.row] as EProduct
       // SelectedItemID = "1"
        if(searching == true)
        {
            let vc = BookAppointmentViewController(nibName: "BookAppointmentViewController", bundle: nil)
            //if let provider = ProviderDBArr![indexPath.row].provider , let patient = ProviderDBArr![indexPath.row].patient {
                vc.Provider = ProviderDBArr![indexPath.row].provider
                vc.distance = String(ProviderDBArr![indexPath.row].distance)
                vc.patient = ProviderDBArr![indexPath.row].patient
            //}
            self.navigationController!.pushViewController(vc, animated: true)
        }
    
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

extension SearchProvidersViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if(searching == true)
        {
            if let count = ProviderDBArr?.count
            {
                return  count
            }
            else
            { return 0 }
        }
        else{
            if let count = ProviderList?.count
            {
                return  count
            }
            else
            { return 0 }
        //return 0
        }
    
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storecell", for: indexPath) as? SerchTableTableViewCell  else {
                   fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
               }
       cell.imageView?.setRounded()
        //cell.imageView.
        if(searching == true)
        {
           // resultDBProviders
            if let name = ProviderDBArr![indexPath.row].provider.hospitalName {
                cell.lblProviderName.text = "  Distance: \(ProviderDBArr![indexPath.row].distance)"
                cell.lblProviderAddress.text = "  \(name)  " //+ ProviderDBArr![indexPath.row].PlaceMark
                if let img =   ProviderDBArr![indexPath.row].provider.image
                {
                    //cell.ImageView?.image = UIImage(data: img)
                    cell.imageView?.image = UIImage(data: img)
                }
                cell.providerObj = ProviderDBArr![indexPath.row].provider
                cell.patientObj = ProviderDBArr![indexPath.row].patient
            }
        }
        else{
        if let name = ProviderList![indexPath.row].hospitalName , let address = ProviderList![indexPath.row].addressLine1{
            cell.lblProviderName.text =  "  " + name
         //   cell.lblProviderAddress.text = " " + address
            
            if let img =   ProviderList![indexPath.row].image
            {
               // cell.ImageView?.image = UIImage(data: img)
                cell.imageView?.image = UIImage(data: img)
            }
        }
            
          //  cell.ImageView.layer.cornerRadius = 20 // change this number to get the corners you want
           // cell.ImageView.layer.masksToBounds = true
        }
        
     /*  cell.requestObj = pendingInventoryReq![indexPath.row] as Db_InventoryRequest
        cell.requestID = pendingInventoryReq![indexPath.row].requestID
        cell.providerObj = pendingInventoryReq![indexPath.row].provider
        if let name = pendingInventoryReq![indexPath.row].item
        {
        cell.ItemName.text = name
        }
       
        cell.ItemQuantity.text = String(pendingInventoryReq![indexPath.row].quantity)
   
        if let prodname = pendingInventoryReq![indexPath.row].provider?.hospitalName
        {
        cell.ProviderName.text = prodname
        }
        if let address = pendingInventoryReq![indexPath.row].provider?.addressLine1 , let city = pendingInventoryReq![indexPath.row].provider?.city
        {
            cell.providerAddress.text = "\(address) \(city)"
        }
        if let name = pendingInventoryReq![indexPath.row].item
        {
            if(name == "Covid19 Vaccine" || name == "Covid Vaccine")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "Covid19Vaccine")
            }
            else  if(name == "PPE  Kit")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "PPEkit")
            }
            else  if(name == "N95Masks")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "N95Mask")
            }
            else  if(name == "Covid19 Test Kit")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "Civid19TestKit")
            }
           
            
        } */
        return cell
    }
    
    
}
class Slocation
{
    init(vlattitude:String,vLongitude:String) {
        self.lattitude = vlattitude
        self.Longitude = vLongitude
    }
    let lattitude:String?
    let Longitude:String?
}

class Response
{
    var Ditance:Double?
    var Time:Double?
}

class ResultProviders  {
    var distance = Double()
    var PlaceMark = String()
    var Time = Double()
}

class ResultDBProviders  {
    var provider = DB_Hospital()
    var patient = DB_Patient()
    var distance = Double()
    var PlaceMark = String()
    var Time = Double()
}
