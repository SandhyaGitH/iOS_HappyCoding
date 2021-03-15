//
//  main.swift
//  Assignment4
//
//  Created by Sandhya Goswami on 10/15/20.
//

import Foundation

//print("Hello, World!")
var email:String=""
var  password :String=""
var role: String=""
var UniqNumber: Int = 0;
var Users: [User] = []
var user=User(email:"s@g.com",UserName:"sandy",Password:"sandy",Role:"User")
var id:String = String(Users.count+1)
user.vUniqueId=id
Users.append(user);
user=User(email:"Admin@g.com",UserName:"Admin1",Password:"Admin1",Role:"Admin")
id = String(Users.count+1)
user.vUniqueId=id
Users.append(user);
user=User(email:"test1@",UserName:"test1user",Password:"test1",Role:"User")
id = String(Users.count+1)
user.vUniqueId=id
Users.append(user);
user=User(email:"test2@",UserName:"test2user",Password:"test2",Role:"User")
id = String(Users.count+1)
user.vUniqueId=id
Users.append(user);

var AdminMenu:[String]=[
    "Type -1 for LogOut",
    "Type 1 for View All Profiles",
    "Type 2 for Delete Profiles",
    "Type 3 for Add Profile",
    "Type 4 for Update Profile",
    //   "Type 5 for Billing n Payment",
    
    "Type 6 for Show User's Show",
   // "Type 7 for add new Show",
   // "Type 8 for remove Show",

    "Type 10 for Exit"
    
    // "Type 4 for show all Shows",
    
    //   On Selecting a particular profile show the following :-
    //  1. TV Shows - On selection display all shows
    //  2. Movies - On selection display all Movies
    //  3. My List - On selection display list pertaining to the profile only
    
    // Add Profile - Name and Unique id
    
    
    //Billing and Payments
]
var UserMenu:[String]=[
    "Type -1 for Logout",
    "Type 0 for View My Profile",
    "Type 1 for Delete Profile",
    "Type 2 for Update Profile",
    "Type 3 for Add a TV Show/Movie to my list",
    "Type 4 for Display all on My List",
    "Type 5 for Remove from My List ",
    "Type 6 for View Billing Plans",// - Basic, Standard, Premium
    "Type 7 for Add Plan",
    "Type 8 for View My Plan",
    "Type 9 for Update Plan",
    "Type 10 for Exit from menu"
]
var AllShows: [shows] = []
var show = shows("Breaking Bad","TV")
AllShows.append(show);
show = shows("Narcos","TV")
AllShows.append(show);
show = shows("House Of cards","TV")
AllShows.append(show);
show = shows("Things","TV")
AllShows.append(show);
show = shows("Better Call Saul","TV")
AllShows.append(show);
show = shows("Secred Games","TV")
AllShows.append(show);

show = shows("God Father","Movie")
AllShows.append(show);
show = shows("Ell Camino","Movie")
AllShows.append(show);
show = shows("Movie3","Movie")
AllShows.append(show);
show = shows("Movie4","Movie")
AllShows.append(show);
show = shows("Movie5","Movie")
AllShows.append(show);
show = shows("Movie6","Movie")
AllShows.append(show);

enum PlanTypes:Int {
    case   Basic=1, Standard=2, Premuim=3
    
}

protocol Plan {
    //var planprice:Int { get <#set#> }
    func AddPlan(user:User)
    func ViewPlan()
    func UpdatePlan(user:User)
    
}
class Basicplan:Plan{
    func ViewPlan() {
        print("Your plan type is \(PlanType)")
    }
    var PlanType:PlanTypes
    init(Plantype:PlanTypes) {
        self.PlanType=Plantype
    }
    // var planprice: Int
    
    
    func AddPlan(user:User) {
        user.MyPlan=Basicplan(Plantype: PlanTypes.Basic)
    }
    
    
    
    func UpdatePlan(user:User) {
        user.MyPlan=Basicplan(Plantype: PlanTypes.Basic)
    }
    
    
}
class Standardplan:Plan{
    func ViewPlan() {
        print("Your plan type is \(PlanType)")
    }
    var PlanType:PlanTypes
    init(Plantype:PlanTypes) {
        self.PlanType=Plantype
    }
    // var planprice: Int
    
    
    func AddPlan(user:User) {
        user.MyPlan=Standardplan(Plantype: PlanTypes.Standard)
    }
    
    
    
    func UpdatePlan(user:User) {
        user.MyPlan=Standardplan(Plantype: PlanTypes.Standard)
    }
    
    
}

class Premuim:Plan{
    func ViewPlan() {
        print("Your plan type is \(PlanType)")
    }
    var PlanType:PlanTypes
    init(Plantype:PlanTypes) {
        self.PlanType=Plantype
    }
    // var planprice: Int
    
    
    func AddPlan(user:User) {
        user.MyPlan=Premuim(Plantype: PlanTypes.Premuim)
    }
    
    
    
    func UpdatePlan(user:User) {
        user.MyPlan=Premuim(Plantype: PlanTypes.Premuim)
    }
    
    
}

protocol Person{
    
    func showProfileDetails()
    
    func Myshows()
    
    // var UniqueId: String { get <#set#> }
}

class User:Equatable,Person{
    //var UniqueId: String
    
    func showProfileDetails() {
        //  print("Role:\(self.vrole) Email: \(self.vemail) Name: \(self.vUserName)")
    }
    
    func Myshows() {
        for show in self.MyShows
        {
            print(show.toString())
        }
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return (lhs.vemail == rhs.vemail && lhs.vpassword == rhs.vpassword && lhs.vrole == rhs.vrole)
    }
    
    
    
    //init(){}
    init (email:String, Password:String, Role:String) {
        self.vemail=email
        self.vpassword=Password
        self.vrole=Role
        
    }
    
    init(email:String,UserName:String , Password:String, Role:String) {
        self.vemail=email
        self.vUserName=UserName
        self.vpassword=Password
        self.vrole=Role
    }
    var vemail:String = "";
    var vUserName: String="";
    var vpassword:String = "";
    var vrole:String = "";
    var vUniqueId:String="";
    
    //var letters = Set<shows>()
    var MyShows: [shows] = []
    // var Mylists: [myList] = []
    
    var MyPlan: Plan = Basicplan(Plantype: PlanTypes.Basic)
    
    
}

class shows:Equatable{
    static func == (lhs: shows, rhs: shows) -> Bool {
        return (lhs.ShowId == rhs.ShowId )
    }
    
    init(_ name:String, _ showType: String ) {
        self.Name=name
        self.ShowType=showType
        UniqNumber+=1
        ShowId=UniqNumber
    }
    var ShowId:Int = UniqNumber
    var Name: String = ""
    var ShowType: String = ""
    
}
extension shows{
    func toString()->String
    {
        let ShowDetails : String = String(self.ShowId) + " " + self.Name + " " + self.ShowType
        return ShowDetails
    }
}
extension User{
    func showMyProfile() {
        print("UniqueID: \(vUniqueId) Role: \(self.vrole) Email: \(self.vemail) Name: \(self.vUserName)")
    }
    func toString()->String
    {
        let UserDetails : String =  "ID: " + self.vUniqueId + " Role: " + String(self.vrole) + " Email: " + self.vemail + " Name: " + self.vUserName
        return UserDetails
    }
}

extension Array{
    func FindShow(_ showId:String)->shows?{
        var selectedshow:shows?
        for show in AllShows
        {
            if(show.ShowId==Int(showId))
            {
                selectedshow=show
                return selectedshow!
            }
        }
        // guard let hh = selectedshow! else { return selectedshow }
        return nil;
    }
    
    func containsId(_ showId:String)->Bool
    {
        for show in AllShows
        {
            if(show.ShowId==Int(showId))
            {
                return true
            }
        }
        return false
        
    }
    func FindProfile(_ Uid:String)->User?{
        var selectedUser:User?
        for user in Users
        {
            if(user.vUniqueId == Uid)
            {
                selectedUser=user
                return selectedUser!
            }
        }
        // guard let hh = selectedshow! else { return selectedshow }
        return nil;
    }
    func FindProfileByemail(_ emailid:String)->User?{
        var selectedUser:User?
        for user in Users
        {
            if(user.vemail == emailid)
            {
                selectedUser=user
                return selectedUser!
            }
        }
        // guard let hh = selectedshow! else { return selectedshow }
        return nil;
    }
    
    func isUniqueidExist(_ Uid:String)->Bool
    {
        for user in Users
        {
            if(user.vUniqueId==String(Uid))
            {
                return true
            }
        }
        return false
        
    }
    func  DisplayAll() {
        
        for item in self
        {
            if(item as? String != nil)
            {
                print(item)// print("yes")
            }
            else if(item as? shows != nil)
            {
                let showitem = item as? shows
                print(showitem!.toString())
            }
            else if(item as? User != nil)
            {
                let user = item as? User
                
                if(user?.vrole != "Admin")
                { print(user!.toString())
                    // print("Shows")
                }
            }
            
            else { print(item)}
        }
    }
    
    func ChooseMenu()->String{
        //self.DisplayAll()
        let menuid = takeInput("Menu", "Please enter the menu Id")
        return menuid
    }
}



class myList{
    init(name:String) {
        self.ListName=name
        // self.ShowType=showType
    }
    var ListName: String
    var ListItems:[shows] = []
}

class UserAuthentication{
    func login(_ Pemail: String, _ Ppassword: String, _ Prole:String)->Int{
        var loginuser = User(email: Pemail, Password: Ppassword , Role: Prole);
        
        
        if(Users.contains(loginuser))
        {
            loginuser = Users.FindProfileByemail(_:Pemail)!
            if(role=="Admin")
            { print("welcome Admin!");
                
                AdminMenu.DisplayAll()
                var menuid = AdminMenu.ChooseMenu()
                // guard let index =  Users.firstIndex(of: loginuser) else { return <#default value#> }
                repeat{
                    switch menuid {
                    case "-1":
                        break;
                    case "1":
                        Users.DisplayAll()
                    case "2": // delete profile
                        let id = takeInput("DeleteProfile", "Please provide User Unique Id to be deleted ");
                        let selectedUser =  Users.FindProfile(_ : id)
                        guard let Dindex =  Users.firstIndex(of: selectedUser!) else { return  -1}
                        if(Dindex != -1) {Users.remove(at: Int(Dindex));
                            print("Deleted!")
                            Users.DisplayAll()}
                        else { print("Inavlid input")}
                    case "3": //add profile
                        intializeInputs()
                        let name = takeInput("Name", "enter your Name")
                        let Newprofile = User(email: email,UserName: name, Password: password, Role: role)
                        let id:String = String(Users.count+1)
                        
                        Newprofile.vUniqueId=id
                        Users.append(Newprofile);
                        //Users.remove(at: Int(Dindex)!)
                        print("Added!")
                        Users.DisplayAll()
                    case "4": // update profile
                        let id = takeInput("DeleteProfile", "Please provide User Unique Id to be updated ");
                        let selectedUser =  Users.FindProfile(_ : id)
                        guard let Uindex =  Users.firstIndex(of: selectedUser!) else { return  -1 }
                        if(Uindex != -1)
                        {  intializeInputs()
                            let name = takeInput("Name", "enter your Name")
                            let updateduser = User(email: email, UserName: name ,Password: password,Role: role)
                            // let id = loginuser.vUniqueId
                            updateduser.vUniqueId=id
                            Users[Uindex]=updateduser
                            print("updated")
                            Users.DisplayAll()
                        } else {
                            print("user does not exist")
                        }
                    case "6":
                        let id = takeInput("DeleteProfile", "Please provide User Unique Id");
                        let selectedUser =  Users.FindProfile(_ : id)
                        
                        print("Type T for TV shows")
                        print("Type M for Movie shows")
                        print("Type A for All shows")
                        let  showtype = takeInput("ShowType", "Please provide show type ");
                        if(showtype.uppercased()=="T")
                        {
                            for show in selectedUser!.MyShows
                            {
                                if(show.ShowType.uppercased()=="TV")
                                {
                                    print(show.toString())
                                }
                            }
                        }
                        else if(showtype.uppercased()=="M")
                        {
                            for show in selectedUser!.MyShows
                            {
                                if(show.ShowType.uppercased()=="MOVIE")
                                {
                                    print(show.toString())
                                }
                            }
                        }
                        else if(showtype.uppercased()=="A")
                        {
                            for show in selectedUser!.MyShows
                            {
                                
                                print(show.toString())
                                
                            }
                        }
                        else { print("not a vaid input")}
                   default:
                        menuid = "10"
                    }
                    if( menuid != "-1"){
                    
                    let  iscontinue = takeInput("Continuing", "Press Y if want to continue with the menu");
                    if(iscontinue.uppercased()=="Y")
                    {  AdminMenu.DisplayAll()
                        menuid =  AdminMenu.ChooseMenu()}
                    else{
                        menuid = "10"
                    }
                    }
                    
                }while(menuid != "10" && menuid != "-1")
                
                if(menuid == "-1")
                {
                    var  input:String=""
                    input =  takeInput("Registration", "type R for Registration or L for login")
                    if(input.uppercased() == "R")
                    {
                        intializeInputs()
                        let name = takeInput("Name", "enter your Name")
                        let user = User(email: email, UserName: name ,Password: password,Role: role)
                        UAuthentication.Register(user)
                        
                    }
                    else if(input.uppercased()  == "L")
                    {
                        intializeInputs()
                        if(email != "" && password != "")
                        {UAuthentication.login(_:email,_:password, _:role);}
                    }
                }
                
            }
            else
            {
                print("welcome User!");
                var iscontinue :String="";
                UserMenu.DisplayAll()
                var menuid =  UserMenu.ChooseMenu()
                // let menuid = takeInput("Menu", "Please enter the menu Id")
                let index =  Users.firstIndex(of: loginuser)
                repeat{
                    switch menuid {
                    case "-1":
                     break;
                    case "0": // view my profile
                        if(index != nil)
                        {
                            loginuser.showMyProfile()
                        }
                    case "1"://Delete Profile
                        
                        if(index != nil)
                        { Users.remove(at: index!)}
                        print("Account Deleted successfully")
                         menuid="-1";  // UAuthentication.login(_:nemail,_:npassword, _:nrole);
                    case "2":   // Update Profile
                        intializeInputs()
                        if(index != nil)
                        {
                            let name = takeInput("Name", "enter your Name")
                            let user = User(email: email, UserName: name ,Password: password,Role: role)
                            let id = loginuser.vUniqueId
                            user.vUniqueId=id
                            Users[index!]=user
                            loginuser=Users[index!]
                            //UserMenu.DisplayAll()
                        }
                    case "3": //Add a TV Show/Movie to my list
                        
                        AllShows.DisplayAll()
                        let showId = takeInput("ShowAdd", "Please enter the show ID to be added")
                        guard  let Addedshows = AllShows.FindShow(showId) else {return -1}
                        if(Addedshows != nil)
                        {
                            
                            if(loginuser.MyShows.count<5)
                            {
                                
                                Users.FindProfile(_ : loginuser.vUniqueId)?.MyShows.append(Addedshows)
                                Users.FindProfile(_ : loginuser.vUniqueId)?.Myshows()
                                iscontinue = takeInput("Continuing", "Press 3 to add more shows else press any other key")
                                if(iscontinue=="3")
                                {
                                    menuid =  "3"
                                    
                                }
                            }
                            else{
                                print("Sorry ! You can add upto 5 Shows only")
                                iscontinue=""
                            }
                        }
                        
                        
                        
                    case "4":// Display all on My List
                        loginuser.Myshows()
                        
                    case "5":  //Remove from my List
                        loginuser.Myshows()
                        var showId :String="0"
                        var DeletedShow:shows?
                        repeat
                        {
                            print("Please enter the show ID to be Deleted", terminator: ".");
                            showId=readLine()!
                            // AllShows.contains(<#T##element: shows##shows#>)
                        }while(!loginuser.MyShows.containsId(showId))
                        
                        DeletedShow=loginuser.MyShows.FindShow(showId)!
                       // let index =  loginuser.MyShows.firstIndex(of: DeletedShow!)
                        let index = Users.FindProfile(_ : loginuser.vUniqueId)!.MyShows.firstIndex(of: DeletedShow!)
                        if(index != nil)
                        { Users.FindProfile(_ : loginuser.vUniqueId)!.MyShows.remove(at: index!)}
                        Users.FindProfile(_ : loginuser.vUniqueId)!.Myshows()
                    case "6": //View Billing Plans - Basic, Standard, Premium
                        // let index =  Users.firstIndex(of: loginuser)
                        // if(index != nil)
                        //  { Users.remove(at: index!)}
                        // Add Plan
                        
                        print("type 1 for \(PlanTypes.Basic)")
                        print("type 2 for \(PlanTypes.Standard)")
                        print("type 3 for \(PlanTypes.Premuim)")
                    case "7":   var planid:String
                        print("type 1 for \(PlanTypes.Basic)")
                        print("type 2 for \(PlanTypes.Standard)")
                        print("type 3 for \(PlanTypes.Premuim)")
                        repeat
                        {
                            print("Please enter the one of the  plan Id", terminator: ".");
                            planid=readLine()!
                            // AllShows.contains(<#T##element: shows##shows#>)
                        }while(planid != "1" && planid != "2" && planid != "3")
                        if(planid=="1")
                        {loginuser.MyPlan = Basicplan(Plantype: PlanTypes.Basic)}
                        else if(planid=="2")
                        {loginuser.MyPlan = Standardplan(Plantype: PlanTypes.Standard)}
                        else if(planid=="3")
                        {loginuser.MyPlan = Basicplan(Plantype: PlanTypes.Premuim)}
                        print("You plan is \( loginuser.MyPlan.ViewPlan()) now.")
                    case "8":// View My Plan
                        loginuser.MyPlan.ViewPlan()
                    case "9": // Update Plan
                        print("type 1 for \(PlanTypes.Basic)")
                        print("type 2 for \(PlanTypes.Standard)")
                        print("type 3 for \(PlanTypes.Premuim)")
                        var planid:String
                        repeat
                        {
                            print("Please enter the one of the  plan Id", terminator: ".");
                            planid=readLine()!
                            // AllShows.contains(<#T##element: shows##shows#>)
                        }while(planid != "1" && planid != "2" && planid != "3")
                        if(planid=="1")
                        {loginuser.MyPlan = Basicplan(Plantype: PlanTypes.Basic)}
                        else if(planid=="2")
                        {loginuser.MyPlan = Standardplan(Plantype: PlanTypes.Standard)}
                        else if(planid=="3")
                        {loginuser.MyPlan = Basicplan(Plantype: PlanTypes.Premuim)}
                        print("You plan upgraded to \( loginuser.MyPlan.ViewPlan()).")
                        
                    default:
                        UserMenu.DisplayAll()
                        menuid =  UserMenu.ChooseMenu()
                    }
                    
                    if(iscontinue != "3" && menuid != "-1"){
                        // iscontinue = ""
                        iscontinue = takeInput("Continuing", "Press Y if want to continue with the menu");
                        // iscontinue = ""
                    }
                    if(iscontinue.uppercased()=="Y")
                    {  UserMenu.DisplayAll()
                        menuid =  UserMenu.ChooseMenu()
                        iscontinue=""
                    }
                   
                }while(menuid != "10" && menuid != "-1")
                
                if(menuid == "-1")
                {
                    var  input:String=""
                    input =  takeInput("Registration", "type R for Registration or L for login")
                    if(input.uppercased() == "R")
                    {
                        intializeInputs()
                        let name = takeInput("Name", "enter your Name")
                        let user = User(email: email, UserName: name ,Password: password,Role: role)
                        UAuthentication.Register(user)
                        
                    }
                    else if(input.uppercased()  == "L")
                    {
                        intializeInputs()
                        if(email != "" && password != "")
                        {UAuthentication.login(_:email,_:password, _:role);}
                    }
                }
                
            }
            return 1
        }
        else{
            
            
            print("Please register first.");
            var  input:String=""
            input =  takeInput("Registration", "type R for Registration or L for login")
            if(input.uppercased() == "R")
            {
                intializeInputs()
                let name = takeInput("Name", "enter your Name")
                let user = User(email: email, UserName: name ,Password: password,Role: role)
                UAuthentication.Register(user)
                
            }
            else if(input.uppercased()  == "L")
            {
                intializeInputs()
                if(email != "" && password != "")
                {UAuthentication.login(_:email,_:password, _:role);}
            }
            return -1;
            
        }
        
        
        //let user = User();
    }
    
    func Register(_ userobj : User){
        if(Users.contains(userobj))
        {
            print("Already Exist");
            
        }
        else{
            let id:String = String(Users.count+1)
            userobj.vUniqueId=id
            Users.append(userobj)
            print("Successfully Registered! Please Login");
            email = takeInput(_:"Email",_:"enter the email")
            password = takeInput(_:"Password",_:"enter the Password")
            if(email != "" && password != "")
            {UAuthentication.login(_:email,_:password, _:role);}
            
        }
    }
    
    
    // if(user.
}



func intializeInputs(){
    role="";email=""; password="";
    role = takeInput(_:"Role",_:"type A for Admin and U for User Account")
    email = takeInput(_:"Email",_:"enter the email")
    password = takeInput(_:"Password",_:"enter the Password")
    /* repeat
     {
     print("type A for Admin and U for User Account", terminator: ".");
     let  inputrole=readLine()!
     if(inputrole=="A")
     {
     role="Admin"
     }
     else if(inputrole=="U")
     {
     role="User"
     }
     
     }while(role != "Admin" && role != "User")
     
     repeat{
     print("enter the email", terminator: ".");
     let  inputemail :String? = readLine()
     if inputemail != nil {
     email = inputemail!
     }
     
     } while(email=="")
     
     repeat{
     print("enter the Password", terminator: ".");
     let  inputpswrd :String? = readLine()
     if inputpswrd != nil {
     password = inputpswrd!
     }
     
     } while(password=="")
     
     */
    
}

//intializeInputs()
var UAuthentication = UserAuthentication();
intializeInputs()
if(email != "" && password != "")
{UAuthentication.login(_:email,_:password, _:role);}
//UAuthentication.Register();


func takeInput( _ inputFor :String , _ inputMessage:String)-> String
{
    var outputstring:String = "";
    //var MCondition:String = ""
    if(inputFor=="Role")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            let  inputrole=readLine()!
            
            if(inputrole.uppercased() == "A")
            {
                outputstring="Admin"
            }
            else if(inputrole.uppercased() == "U")
            {
                outputstring="User"
            }
            
            
        }while(outputstring != "Admin" && outputstring != "User")
    }
    else  if(inputFor=="Password" || inputFor=="Email" || inputFor=="Name" || inputFor=="Menu" || inputFor=="Continuing")
    {
        repeat{
            print(inputMessage, terminator: ".");
            let  inputpswrd :String? = readLine()
            if inputpswrd != nil {
                outputstring = inputpswrd!
            }
            
        } while(outputstring=="")
    }
    else if(inputFor=="Registration")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
        }while(outputstring.uppercased() != "R" && outputstring.uppercased() != "L")
    }
    else if(inputFor=="ShowType")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
        }while(outputstring.uppercased() != "T" && outputstring.uppercased() != "M" && outputstring.uppercased() != "A")
    }
    
    else if(inputFor=="ShowAdd")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
            // AllShows.contains(<#T##element: shows##shows#>)
        }while(!AllShows.containsId(outputstring))
    }
    else if(inputFor=="DeleteProfile")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
            // AllShows.contains(<#T##element: shows##shows#>)
        }while(!Users.isUniqueidExist(outputstring))
    }
    
    
    
    return outputstring
}


