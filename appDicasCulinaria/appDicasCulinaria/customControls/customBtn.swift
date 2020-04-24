//
//  customBtn.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 16/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class customBtn: UIButton {
    
    @IBOutlet weak var view : UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setStyle();
    }
    
    func loadViewFromNib() -> UIView! {
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
      let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIButton
      
      return view
    }
    
    func setStyle() {
        view = loadViewFromNib() as! UIButton?
        view.frame = bounds
        
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
        
        setTitle("Botão", for: .normal)
//        setTitleColor(.green, for: .normal)

        backgroundColor = .init(red: 0.46, green: 1.0, blue: 0.65, alpha: 0.8)
        layer.borderColor = .init(srgbRed: 0, green: 1.0, blue: 0, alpha: 1)
        layer.borderWidth = 1.5
        layer.cornerRadius = 9
    }
}
