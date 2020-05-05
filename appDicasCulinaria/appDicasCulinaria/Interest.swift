//
//  Interest.swift
//  appDicasCulinaria
//
//  Created by marcelo frost marchesan on 04/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class Interest {
    
    var title = ""
    var featuredImage: UIImage
    var color: UIColor
    
    init(title: String, featuredImage: UIImage, color: UIColor) {
        self.title = title
        self.featuredImage = featuredImage
        self.color = color
    }
    
    static func fetchInterests() -> [Interest] {
        return [
            Interest (title: "Teste 1", featuredImage: UIImage (named: "img1")!, color: UIColor(red: 63/255, green: 71/255, blue: 80/255, alpha: 0.8)),
            Interest (title: "Teste 2", featuredImage: UIImage (named: "img2")!, color: UIColor(red: 63/255, green: 71/255, blue: 80/255, alpha: 0.8)),
            Interest (title: "Teste 3", featuredImage: UIImage (named: "img3")!, color: UIColor(red: 63/255, green: 71/255, blue: 80/255, alpha: 0.8)),
            Interest (title: "Teste 4", featuredImage: UIImage (named: "img4")!, color: UIColor(red: 63/255, green: 71/255, blue: 80/255, alpha: 0.8))
        ]
    }
    
}
