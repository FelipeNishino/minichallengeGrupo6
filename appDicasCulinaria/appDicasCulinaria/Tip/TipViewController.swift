//
//  TipViewController.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 04/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var tipTitle : UILabel!
    @IBOutlet weak var tipBody : UILabel!
    @IBOutlet weak var btnFav : UIButton!
    var tipId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnFav.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        tipTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    
        btnFav.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        
        print("check if favorited")
        print(UserDefaults.Favorites.debugDescription, tipId)
        if UserDefaults.Favorites.contains(tipId) {
            print(true)
            btnFav.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            print(false)
        }
    }
    
    @objc func toggleFavorite() {     
        if UserDefaults.Favorites.contains(tipId) {
            defer {
                print("tip \(tipId) unfavorited")
            }
            print(UserDefaults.Favorites.sorted().count, UserDefaults.Favorites.sorted().debugDescription)
            btnFav.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            UserDefaults.Favorites.remove(tipId)
            print(UserDefaults.Favorites.sorted().count, UserDefaults.Favorites.sorted().debugDescription)
        }
        else {
            defer {
                print("tip \(tipId) favorited")
            }
            print(UserDefaults.Favorites.sorted().count, UserDefaults.Favorites.sorted().debugDescription)
            btnFav.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            UserDefaults.Favorites.insert(tipId)
            print(UserDefaults.Favorites.sorted().count, UserDefaults.Favorites.sorted().debugDescription)
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
