//
//  AppDelegate.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 07/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let userDefaults = UserDefaults.standard
        
        
        print("enter delegate ud init")
        
        if userDefaults.object(forKey: "Tips") == nil {
            var dict = [String : Tip]()
            
            dict.updateValue(Tip(title: "Dica 0", text: "dica 0 lorem ipsum", tag: [7], fav: true, imgURL: ""), forKey: "0")
            dict.updateValue(Tip(title: "Dica 1", text: "dica 1 lorem ipsum", tag: [6], fav: true, imgURL: ""), forKey: "1")
            dict.updateValue(Tip(title: "Dica 2", text: "dica 2 lorem ipsum", tag: [5], fav: true, imgURL: ""), forKey: "2")
            dict.updateValue(Tip(title: "Dica 3", text: "dica 3 lorem ipsum", tag: [4], fav: true, imgURL: ""), forKey: "3")
            dict.updateValue(Tip(title: "Dica 4", text: "dica 4 lorem ipsum", tag: [3], fav: true, imgURL: ""), forKey: "4")
            dict.updateValue(Tip(title: "Dica 5", text: "dica 5 lorem ipsum", tag: [2], fav: true, imgURL: ""), forKey: "5")
            dict.updateValue(Tip(title: "Dica 6", text: "dica 6 lorem ipsum", tag: [1], fav: true, imgURL: ""), forKey: "6")
            dict.updateValue(Tip(title: "Dica 7", text: "dica 7 lorem ipsum", tag: [0], fav: true, imgURL: ""), forKey: "7")

            print("dict init")
            
            UserDefaults.Tips = dict
        
            print("set ud dict")
        }
        
        if userDefaults.object(forKey: "Favorites") == nil {
            let fav : Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7]
            print("init fav")

            UserDefaults.Favorites = fav
            print("set ud fav")
        }

        if userDefaults.object(forKey: "Interests") == nil {
            let interests : Set<Int> = [3, 6, 1]
            print("init interests")

            UserDefaults.Interests = interests
            print("set ud interests")
        }
        print("exit delegate ud init")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

