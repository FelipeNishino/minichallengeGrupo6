//
//  TestUserDef.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 29/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class TestUserDef: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTest(_ sender: Any) {
        
       let dict = UserDefaults.Tips
        let userdef = UserDefaults.standard
        userdef.removeObject(forKey: "Tips")
        userdef.removeObject(forKey: "Favorites")
        userdef.removeObject(forKey: "Interests")
        
        lbl.text = dict["0"]?.fav.description
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
