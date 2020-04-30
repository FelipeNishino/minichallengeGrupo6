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
    @IBOutlet weak var lbl: UILabel!
    
    @IBAction func ApagarUD(_ sender: Any) {
        let userDef = UserDefaults.standard
        
        userDef.removeObject(forKey: "Tips")
        userDef.removeObject(forKey: "Favorites")
        userDef.removeObject(forKey: "Interests")
    }
    @IBAction func LerUD(_ sender: Any) {
        print("entrou")
        
        let dict = UserDefaults.Tips
        
        lbl.text = dict["0"]?.text
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
