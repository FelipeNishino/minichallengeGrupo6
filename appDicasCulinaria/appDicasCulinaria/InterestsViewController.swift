//
//  InterestsViewController.swift
//  appDicasCulinaria
//
//  Created by marcelo frost marchesan on 04/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var interests = Interest.fetchInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    }
}

extension InterestsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carrossellcollectionviewcell", for: indexPath) as! carrossellcollectionviewcell
        
        let interest = interests[indexPath.item]
        
        cell.interest = interest
        
        return cell
    }






}


