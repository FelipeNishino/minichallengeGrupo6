//
//  CategoryCollectionViewController.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 07/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class CategoryCollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {
    let cellId = "categoryCellId"
    let interests = UserDefaults.Interests
    let tips = UserDefaults.Tips
    var firstLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //     defer {
        self.navigationController?.delegate = self
        
        //            collectionView.backgroundColor = .green
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: cellId)
               }
        
       //         print("clearing ud")
        //
       //         defer {
        //            print("ud cleared")
        //        }
        //        defer {
        //            UserDefaults.standard.removeObject(forKey: "Tips")
        //            print("tips cleared")
        //        }
        //        defer {
        //            UserDefaults.standard.removeObject(forKey: "Favorites")
        //            print("favorites cleared")
        //        }
        //        do {
        //            UserDefaults.standard.removeObject(forKey: "Interests")
        //            print("interests cleared")
         //       }
    // }
    
    override func viewDidAppear(_ animated: Bool) {
        print("1")
        super.viewDidAppear(true)
        //        print("view didappear")
        if !firstLoad {
            collectionView.reloadData()
            firstLoad = true
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("2")
        var auxSet = Set<Int>()
        var auxSet2 = interests
        
        //        print("antes da condição: \(interests.debugDescription)")
        
        
        for i in 0...auxSet2.count - 1 {
            let filteredTips = tips.filter{ key, value in
                (tips[key]?.tag.contains(auxSet2.sorted()[i]))!
            }
            
            //            print("Dicas: \(tips.count), i: \(i)")
            
            if filteredTips.isEmpty {
                auxSet2.remove(auxSet2.sorted()[i])
            }
        }
        
        //        print("depois da condição: \(interests.debugDescription)")
        
        for i in 0...tips.count{
            auxSet.insert(i)
        }
        //        print("dicas validas:\(auxSet.intersection(interests).count)")
        return auxSet.intersection(auxSet2).count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("3")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCollectionCell
        //        cell.backgroundColor = .blue
        
        let category = interests.sorted()[indexPath.row]
        cell.delegate = self
        cell.category = category
        cell.lblCategory.text = Tags.findTag(searchId: category).rawValue.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 150)
    }
    
    
}
