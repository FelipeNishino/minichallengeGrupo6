//
//  CategoryCollectionCell.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 07/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class CategoryCollectionCell : UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "tipCellId"
    var category : Int!
    var filteredTips = [String : Tip]()
    var keys = [String]()
    var categoryArray = [Int]()
    weak var delegate : CategoryCollectionViewController?
    
    let lblCategory : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let tipscollectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 375, height: 200), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        SetupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetupViews() {
        addSubview(tipscollectionview)
        addSubview(lblCategory)
        
        lblCategory.font = UIFont.systemFont(ofSize: 32)
        
        tipscollectionview.dataSource = self
        tipscollectionview.delegate = self
        
        tipscollectionview.register(TipCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        var constraints : [NSLayoutConstraint] = []
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[vlbl]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["vlbl" : lblCategory])
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[vtips]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["vtips" : tipscollectionview])
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-14-[vlbl(30)][vtips]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["vlbl" : lblCategory, "vtips" : tipscollectionview])
        //        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[vtips]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["vtips" : tipscollectionview])
        
        NSLayoutConstraint.activate(constraints)
        
        //        NSLayoutConstraint.activate([
        //            lblCategory.topAnchor.constraint(equalTo: superview!.bottomAnchor),
        //            tipscollectionview.topAnchor.constraint(equalTo: lblCategory.bottomAnchor, constant: 30),
        //            tipscollectionview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
        //            tipscollectionview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        //        ])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredTips = (delegate?.tips.filter{ key, value in
                (delegate?.tips[key]?.tag.contains(category!))!
            })! as [String : Tip]
        
        keys = filteredTips.keys.sorted()

        return filteredTips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var keysInt = [Int]()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TipCollectionCell
        cell.delegate = delegate
        keysInt = keys.map{ Int($0)! }
        keysInt = keysInt.sorted()

        cell.contentView.isUserInteractionEnabled = false
        cell.btnTip.tag = keysInt[indexPath.row]
            
        cell.lblTitle.text = filteredTips[String(keysInt[indexPath.row])]?.title
        cell.key = String(keysInt[(indexPath.row)])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(100)
    }
}
