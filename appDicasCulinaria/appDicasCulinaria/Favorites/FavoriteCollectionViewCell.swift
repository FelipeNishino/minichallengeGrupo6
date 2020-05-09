//
//  FavoriteCollectionViewCell.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 04/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
        cornerRadiusfunc()
      }
    
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var backgroundColorView : UIView!
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var button : UIButton!


    func cornerRadiusfunc () {
        backgroundImage.layer.cornerRadius = 10.0;
        backgroundImage.layer.masksToBounds = true;
        backgroundColorView.layer.cornerRadius = 10.0;
        backgroundColorView.layer.masksToBounds = true;
    }


}
