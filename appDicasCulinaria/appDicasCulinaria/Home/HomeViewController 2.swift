//
//  HomeViewController.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 30/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ApagarUD(_ sender: Any) {        
        print("clearing ud")
        
        defer {
            print("ud cleared")
        }
        defer {
            UserDefaults.standard.removeObject(forKey: "Tips")
            print("tips cleared")
        }
        defer {
            UserDefaults.standard.removeObject(forKey: "Favorites")
            print("favorites cleared")
        }
        do {
            UserDefaults.standard.removeObject(forKey: "Interests")
            print("interests cleared")
        }
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
