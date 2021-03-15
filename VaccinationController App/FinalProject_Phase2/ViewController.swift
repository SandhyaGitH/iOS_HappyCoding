//
//  ViewController.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigation = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil]];

      //  [self.window makeKeyAndVisible];

       // self.window.rootViewController = self.navigation;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
       // let vc = SearchProvidersViewController(nibName: "SearchProvidersViewController", bundle: nil)
       // let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        
       // let vc = Pvdr_HomeViewController(nibName: "Pvdr_HomeViewController", bundle: nil)
          self.navigationController!.pushViewController(vc, animated: true)
    }

    @IBAction func SignUpAction(_ sender: Any) {
        let vc = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
    }

}
