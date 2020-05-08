//
//  UserDefaultsExtension.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 29/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let Tips = "Tips"
        static let Interests = "Interests"
        static let Favorites = "Favorites"
        static let Search = "Search"
    }
    
    class var Tips : Dictionary<String, Tip> {
        get {
            let tipData = standard.object(forKey: Keys.Tips) as? [String : Data]
            var dict = [String : Tip]()
            
            tipData?.forEach({ (key: String, value: Data) in
                dict.updateValue(try! PropertyListDecoder().decode(Tip.self, from: value), forKey: key)
            })
            
            return dict
        }
        set {
            var tipData = [String : Data]()
            
            print(newValue.debugDescription)
            
            newValue.forEach { (key: String, value: Tip) in
                tipData.updateValue(try! PropertyListEncoder().encode(value), forKey: key)
            }
            
            print(tipData.debugDescription)
            
            standard.set(tipData, forKey: Keys.Tips)
        }
    }
    
    class var Interests : Set<Int> {
        get {
            let set = Set(standard.object(forKey: Keys.Interests) as! [Int])
            return set
        }
        set {
            let array = Array(newValue)
            standard.set(array, forKey: Keys.Interests)
        }
    }
    
    class var Favorites : Set<Int> {
        get {
            let set = Set(standard.object(forKey: Keys.Favorites) as! [Int])
            return set
        }
        set {
            let array = Array(newValue)
            standard.set(array, forKey: Keys.Favorites)
        }
    }

}
