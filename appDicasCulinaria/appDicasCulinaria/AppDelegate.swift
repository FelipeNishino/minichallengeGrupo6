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
        
        print("entrou didload")
        
        if userDefaults.object(forKey: "Tips") == nil {
            var dict : [String : Tip]
            dict = ["0" : Tip(title: "Teste", text: "Lorem ipsum sit dolor", tag: [0, 3, 5], fav: false, imgURL: "")]

            print("inicializa dict")
            
            UserDefaults.Tips = dict
        
            print("setou userdefault")
        }
        
        if userDefaults.object(forKey: "Favorites") == nil {
            let fav : Set<Int> = [0, 3]
            print("inicializa fav")

            UserDefaults.Favorites = fav
            print("setou userdefault")
        }

        if userDefaults.object(forKey: "Interests") == nil {
            let interests : Set<Int> = [3, 6, 1]
            print("inicializa interests")

            UserDefaults.Interests = interests
            print("setou userdefault")
        }
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

