//
//  Tip.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 08/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import Foundation

struct Tip : Codable {
    
    var title : String
    var text : String
    var tag : Set<Int>
    var fav : Bool
    var imgURL : String
}
