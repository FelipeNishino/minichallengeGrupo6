//
//  TipCollectionCell.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 07/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class TipCollectionCell : UICollectionViewCell {
    weak var delegate : CategoryCollectionViewController?
    var key = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "placeholderImg")
        iv.frame = CGRect(x: 0, y: 0, width: 150, height: 200)
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let backgroundColorView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 160, width: 150, height: 40)
        view.layer.cornerRadius = 10
        view.backgroundColor = .init(white: 0.5, alpha: 0.5)
        return view
    }()
    
    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "Titulo"
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.frame = CGRect(x: 10, y: 160, width: 140, height: 40)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let btnTip : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 150, height: 200)
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1)//.init(srgbRed: 0.8, green: 0, blue: 0.8, alpha: 1.0)
                btn.layer.borderWidth = 5
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    func SetupViews() {
        addSubview(imageView)
        addSubview(backgroundColorView)
        addSubview(lblTitle)
        addSubview(btnTip)
        
        btnTip.addTarget(self, action: #selector(openTip(_:)), for: .touchUpInside)
    }
    
    @objc func openTip(_ sender: UIButton) {
        print("entrou openTip pelo view controller")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Tip", bundle:nil)
        
        let selectedTip = storyBoard.instantiateViewController(withIdentifier: "Tip") as! TipViewController
        
        delegate?.navigationController?.pushViewController(selectedTip, animated: true)
        
        selectedTip.loadViewIfNeeded()
        
        let key = String(sender.tag)
        
        let tag : Category = Tags.findTag(searchId: (delegate?.tips[key]?.tag.sorted().first)!).rawValue
        
        selectedTip.title = tag.name
        
        selectedTip.btnFav.topAnchor.constraint(equalTo: selectedTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
        selectedTip.tipTitle.topAnchor.constraint(equalTo: selectedTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
        //        selectedFavTip.tipTitle.bottomAnchor.constraint(equalTo: selectedFavTip.btnFav.bottomAnchor).isActive = true
        
        selectedTip.tipTitle.text = delegate?.tips[key]?.title
        selectedTip.tipTitle.adjustsFontSizeToFitWidth = true
        selectedTip.tipTitle.frame.size.height = selectedTip.tipTitle.intrinsicContentSize.height
        selectedTip.tipTitle.sizeToFit()
        
        selectedTip.tipBody.text = delegate?.tips[key]?.text
        selectedTip.tipBody.frame.size.height = selectedTip.tipBody.intrinsicContentSize.height
        print("saiu openTip")
    }
}
