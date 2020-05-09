//
//  FavoritesViewController.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 04/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var collectionView : UICollectionView!
    var tips = [String : Tip]()
    var favoriteTips = [String : Tip]()
    var favorites = Set<Int>()
    var favArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("setup favorites collection view")
        
        tips = UserDefaults.Tips
        favorites = UserDefaults.Favorites
        favArray = favorites.sorted()
                
        favoriteTips = tips.filter { key, value in
            favorites.contains(Int(key)!)
        }
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewwillappear")
        
        favorites = UserDefaults.Favorites
        favArray = favorites.sorted()
        print(favArray.debugDescription, favArray.count, favorites.count)
        
        print("viewappeared")
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("view didappear")
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension FavoritesViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("get n of favorites == \(favorites.count)")
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as! FavoriteCollectionViewCell
        print(favArray.count, indexPath)
        let favIndex = String(favArray[indexPath.row])
        
        print("setup cell \(indexPath.row), using tip \(favIndex)")
        
        cell.title.text = tips[favIndex]?.title
        cell.backgroundColorView.backgroundColor = .init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.75)
        cell.button.addTarget(self, action: #selector(openTip), for: .touchUpInside)
        cell.button.tag = Int(favIndex)!
        print("Nome passado: \(tips[favIndex]!.imgURL)")
        cell.backgroundImage.image = UIImage(named: tips[favIndex]!.imgURL)
        return cell
    }
    
    @objc func openTip(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Tip", bundle:nil)
        
        let selectedFavTip = storyBoard.instantiateViewController(withIdentifier: "Tip") as! TipViewController
        let key = String(sender.tag)
        let tips = UserDefaults.Tips
        
        selectedFavTip.tipId = sender.tag
        
        self.navigationController?.pushViewController(selectedFavTip, animated: true)
        
        selectedFavTip.loadViewIfNeeded()
        
        selectedFavTip.title = Tags.findTag(searchId: (tips[key]?.tag.sorted().first)!).rawValue.name
        
        //        selectedFavTip.tipTitle.bottomAnchor.constraint(equalTo: selectedFavTip.btnFav.bottomAnchor).isActive = true
        
        selectedFavTip.tipTitle.text = tips[key]?.title
        selectedFavTip.tipTitle.adjustsFontSizeToFitWidth = true
        selectedFavTip.tipTitle.frame.size.height = selectedFavTip.tipTitle.intrinsicContentSize.height
        selectedFavTip.tipTitle.sizeToFit()
        selectedFavTip.tipBody.text = tips[key]?.text
        selectedFavTip.tipBody.frame.size.height = selectedFavTip.tipBody.intrinsicContentSize.height
    }
}
