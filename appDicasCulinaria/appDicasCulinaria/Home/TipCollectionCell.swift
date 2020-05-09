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
        iv.backgroundColor = .init(red: 1.0, green: 0.63, blue: 0, alpha: 1.0)
        iv.frame = CGRect(x: 0, y: 0, width: 150, height: 200)
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let backgroundColorView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 138, width: 150, height: 62)
        view.layer.cornerRadius = 10
        view.backgroundColor = .init(white: 1, alpha: 0.7)
        return view
    }()
    
    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "Titulo"
//        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.frame = CGRect(x: 10, y: 140, width: 130, height: 56)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let btnTip : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 150, height: 200)
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = .init(srgbRed: 1.0, green: 0.52, blue: 0, alpha: 1.0)
        btn.layer.borderWidth = 3
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
        let storyBoard : UIStoryboard = UIStoryboard(name: "Tip", bundle:nil)
        
        let selectedTip = storyBoard.instantiateViewController(withIdentifier: "Tip") as! TipViewController
        selectedTip.tipId = sender.tag
        
        delegate?.navigationController?.pushViewController(selectedTip, animated: true)
        
        selectedTip.loadViewIfNeeded()
        
        let key = String(sender.tag)
        
        
        selectedTip.title = Tags.findTag(searchId: (delegate?.tips[key]?.tag.sorted().first)!).rawValue.name
        selectedTip.btnFav.topAnchor.constraint(equalTo: selectedTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
        selectedTip.tipTitle.topAnchor.constraint(equalTo: selectedTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
        //        selectedFavTip.tipTitle.bottomAnchor.constraint(equalTo: selectedFavTip.btnFav.bottomAnchor).isActive = true
        
        selectedTip.tipTitle.text = delegate?.tips[key]?.title
        selectedTip.tipTitle.adjustsFontSizeToFitWidth = true
        selectedTip.tipTitle.frame.size.height = selectedTip.tipTitle.intrinsicContentSize.height
        selectedTip.tipTitle.sizeToFit()
        
        selectedTip.tipBody.text = delegate?.tips[key]?.text
        selectedTip.tipBody.frame.size.height = selectedTip.tipBody.intrinsicContentSize.height
    }
}
