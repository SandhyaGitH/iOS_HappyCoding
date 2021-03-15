//
//  APIDataViewController.swift
//  Assn9_UsingDB
//
//  Created by Samarth chaturvedi on 12/7/20.
//

import UIKit

class APIDataViewController: UIViewController {

static let  amzurl = "https://api.rainforestapi.com/request?api_key=FE91588FA9D641579AC7355F3A2A6A0E&type=category&url=https%3A%2F%2Fwww.amazon.com%2Fs%3Fbbn%3D16225009011%26rh%3Dn%253A%252116225009011%252Cn%253A502394%252Cn%253A281052"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
 
        
        
        
    
       static func fetchAmazonProducts() -> Void {
        let url = URL(string: amzurl)!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let data = data ,  error == nil {
            print("Error with fetching products: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response)")
            return
          }

            
            print(data)
            
          if let data = data,
             let filmSummary = try? JSONDecoder().decode(Product.self, from: data) {
           // completionHandler(filmSummary. ?? [])
          }
        })
        task.resume()
      }
    
    
    static func fatchAmazonProds() {
        var result : Response?
        let url = URL(string:amzurl)
        
        guard url != nil else { print("Error creating UL");  return }
        
        let request = URLRequest(url: url!)
      
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
         
            guard let data = data ,  error == nil else {
                print("Error with fetching products: \(error)")
            return
          }
            
           
            do{
                 result = try JSONDecoder().decode(Response.self,from:data)
            }
            catch {
                print("error \(error)")
            }
            
            guard let json = result else {
               return
           }
           // print(json.category_results![0].title)
        })
        task.resume()
        
        //return result!
        }
    
}
   



struct Request_info :Codable{
    let success: Bool
    let credits_used: Int
    let credits_remaining: Int
}


struct Request_metadata:Codable{
    let id : String? //130fc2e6a878ee40070c093a678b135b4a3eee7b",
    let created_at :String?
    let processed_at: String?
    let total_time_taken : Float?
    let amazon_url : String? //"https://www.amazon.com/s?bbn=16225009011&rh=n%3A%2116225009011%2Cn%3A502394%2Cn%3A281052"
  }

struct  Request_parameters :Codable {
   let url: String? //"https://www.amazon.com/s?bbn=16225009011&rh=n%3A%2116225009011%2Cn%3A502394%2Cn%3A281052",
   let  type: String?
  }

 
      
struct Pagination:Codable {
    let current_page :Int? //1,
    let  total_pages :Int?
  }

struct Response: Codable{
    let request_info :Request_info?
     let request_metadata : Request_metadata?
 //   let request_parameters : Request_parameters?
    let category_results : [Category_results]?
 //   let pagination : Pagination?
}

/*  struct Category_results :Codable {
    let mainOP  :[myproduct]
} */

struct Category_results: Codable {
    
    let position : Int?
        let title : String?
    let asin: String?
    let link: String?
  //  let categories : Dictionary<String,Any>
    var image : String  = "https://m.media-amazon.com/images/I/71W1KvLH3sL._AC_UY218_.jpg"
   let  is_prime: Bool?
   let  rating: Float?
   let  ratings_total: Int?
   let  sponsored: Bool?
  // let  prices: [price]
   let price: price?
      
}


       

struct category :Codable{
    let name :String
  // let categories : Dictionary<String,Any>
}

struct price :Codable {
let symbol:String?
let value:Float?
let currency: String?
let raw:String
let  name:String?
}
