//
//  SearchCollectionView.swift
//  appDicasCulinaria
//
//  Created by Alexandre  Machado on 08/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//
import UIKit

var data = [Tip]()

class SearchCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var data = [Tip]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath)as! SearchCollectionViewCell
        
        cell.Titulo.text = data[indexPath.row].title
        cell.CaixaDeTexto.backgroundColor = .init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        cell.Botao.addTarget(self, action: #selector(openTip), for: .touchUpInside)
        cell.Botao.tag = Int(indexPath.row)
        
        return cell   }
    
    
    @objc func openTip(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Tip", bundle:nil)
        
        let selectedTip = storyBoard.instantiateViewController(withIdentifier: "Tip") as! TipViewController
        //selectedFavTip.body.text = "abacaxi"
        
        
        selectedTip.loadViewIfNeeded()
        
        var tips = UserDefaults.Tips
        let key = String(sender.tag)
        let tag : Category = Tags.findTag(searchId: (tips[key]?.tag.removeFirst())!).rawValue
        
        selectedTip.title = tag.name
        
        selectedTip.btnFav.topAnchor.constraint(equalTo: selectedTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
        selectedTip.tipTitle.topAnchor.constraint(equalTo: selectedTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
        //        selectedFavTip.tipTitle.bottomAnchor.constraint(equalTo: selectedFavTip.btnFav.bottomAnchor).isActive = true
        
        selectedTip.tipTitle.text = tips[key]?.title
        selectedTip.tipTitle.adjustsFontSizeToFitWidth = true
        selectedTip.tipTitle.frame.size.height = selectedTip.tipTitle.intrinsicContentSize.height
        selectedTip.tipTitle.sizeToFit()
        
        selectedTip.tipBody.text = tips[key]?.text
        selectedTip.tipBody.frame.size.height = selectedTip.tipBody.intrinsicContentSize.height
    }
    
    //


}
