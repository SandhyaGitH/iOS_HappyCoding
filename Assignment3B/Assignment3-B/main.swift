//
//  main.swift
//  Assignment3-B
//
//  Created by Samarth chaturvedi on 10/12/20.
//

import Foundation

//print("Hello, World!")

protocol Authentication {
    func isLoginSuccessful()

}

class User: Authentication {
    func isLoginSuccessful() {
        print("Authenticated")
    }
}
    
    extension Int {
        func repeats(){
            for index in 1...self {
                print("Loading..")
            }
        }
        
    }

let value = 6
value.repeats()

//Create a class “Flight” with variables “from” and “to”
//Now, create an extension to “Flight” that has two functions “changeFrom” and //“changeTo” and implement them.
class flight{
    var from :String = ""
    var to: String = ""
}

extension flight{
    func changeTo(){
        print("this is to value : \(self.to)")
    }
    
    func changeFrom(){
        print("this is from value : \(self.from)")
    }
}

protocol Area {
    func areaOfSphere(radius: Int)->Double
}

class Sphere:Area{
   
    func areaOfSphere(radius:Int)->Double {
        return Double(Double(4) * 3.14 * Double(radius*radius));
        
    }
    
//Define values to find the areaOfSphere() by adopting the protocol
}

extension Sphere {
//Complete the following function to get the value of radius for sphere
    func getRadius(Area:Double)->Double{
        let result = Area/(4*3.14)
        //let rd = result.squareRoot()
        return result.squareRoot()
    }
}

var Instance1 = Sphere()
print("Area is \(Instance1.areaOfSphere(radius: 4))")
print("Radius is \(Instance1.getRadius(Area: 314))")


    
    



