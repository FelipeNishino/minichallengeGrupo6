//
//  buttomn.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 23/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import Foundation
import UIKit

let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 30)!]


@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
