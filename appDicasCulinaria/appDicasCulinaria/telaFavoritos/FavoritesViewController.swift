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
        // Do any additional setup after loading the view.
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

        let favIndex = String(favArray[indexPath.row])
        
        print("setup cell \(indexPath.row), using tip \(favIndex)")
        
        cell.title.text = tips[favIndex]?.title
        cell.backgroundColorView.backgroundColor = .init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        cell.button.addTarget(self, action: #selector(openTip), for: .touchUpInside)
        cell.button.tag = Int(favIndex)!
    
        return cell
    }
    
    @objc func openTip(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Tip", bundle:nil)
        
        let selectedFavTip = storyBoard.instantiateViewController(withIdentifier: "Tip") as! TipViewController
        //selectedFavTip.body.text = "abacaxi"
        
        self.navigationController?.pushViewController(selectedFavTip, animated: true)
        
        selectedFavTip.loadViewIfNeeded()
        
        var tips = UserDefaults.Tips
        let key = String(sender.tag)
        let tag : Category = Tags.findTag(searchId: (tips[key]?.tag.removeFirst())!).rawValue
        
        selectedFavTip.title = tag.name
        
        selectedFavTip.btnFav.topAnchor.constraint(equalTo: selectedFavTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
        selectedFavTip.tipTitle.topAnchor.constraint(equalTo: selectedFavTip.view.safeAreaLayoutGuide.topAnchor).isActive = true
//        selectedFavTip.tipTitle.bottomAnchor.constraint(equalTo: selectedFavTip.btnFav.bottomAnchor).isActive = true
        
        selectedFavTip.tipTitle.text = tips[key]?.title
        selectedFavTip.tipTitle.adjustsFontSizeToFitWidth = true
        selectedFavTip.tipTitle.frame.size.height = selectedFavTip.tipTitle.intrinsicContentSize.height
        selectedFavTip.tipTitle.sizeToFit()
        
        selectedFavTip.tipBody.text = tips[key]?.text
        selectedFavTip.tipBody.frame.size.height = selectedFavTip.tipBody.intrinsicContentSize.height
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return true
//    }
//
//    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//    }
    

}
