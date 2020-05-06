//
//  TelaBusca.swift
//  appDicasCulinaria
//
//  Created by Alexandre  Machado on 06/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    var searchController: UISearchController!
    
    @IBOutlet weak var searchContainerView: UIView!
    var originialDataSource: [String] = []
    var currentDataSource: [String] = []
    
    var setSearch = UserDefaults.Search
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(SearchSomething))
    self.navigationItem.rightBarButtonItem!.isEnabled = false
        
         for Index in 1...dicas.count{
         addProductToDataSource( product: "DICA #\(Index)" )
         }
         
         
         
         currentDataSource = originialDataSource
         
         searchController = UISearchController(searchResultsController: nil)
         searchController.searchResultsUpdater = self
        // searchController.obscuresBackgroundDuringPresentation = false
         searchContainerView.addSubview(searchController.searchBar)
         searchController.searchBar.delegate = self

    
    }
    
    func addProductToDataSource(product: String) {
            originialDataSource.append("\(product)")
        
    }
    func filterCurrentDataSource9(searchTerm: String) {
        
        if searchTerm.count > 0 {
            
            currentDataSource = originialDataSource
            
            let filteredResults = currentDataSource.filter{ $0 .replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased())
                
            }
            
            
            currentDataSource = filteredResults
    
        }
    }
    
    func restoreCurrentDataSource() {
        currentDataSource = originialDataSource
    }
    

@objc func SearchSomething() {
    UserDefaults.Search = setSearch
    refreshSaveBtn()
}
    @objc func refreshSaveBtn() {
         //se lado A e B (adicionar e remover) não estiverem igualmente vazios (diagrama de Venn), então o usuário selecionou algo para acrescentar -> habilite o botão
         if !setSearch.isEmpty {
             self.navigationItem.rightBarButtonItem!.isEnabled = true
         }
             
         //lado A e B estão iguais, nada foi adicionado ou removido -> mantenha o botão de save desabilitado
         else {
             self.navigationItem.rightBarButtonItem!.isEnabled = false
         }
     }
    
}
extension SearchViewController: UISearchResultsUpdating{

func updateSearchResults(for searchController: UISearchController) {
    
    if let searchText = searchController.searchBar.text {
        filterCurrentDataSource9(searchTerm: searchText)
    }
    
 }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchController.isActive = false
        
        if let searchText = searchBar.text{
            filterCurrentDataSource9(searchTerm: searchText)
        }
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        
        if let searchText = searchBar.text, !searchText.isEmpty {
            restoreCurrentDataSource()
        }
        
    }
}

