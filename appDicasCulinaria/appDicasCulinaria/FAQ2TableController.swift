//
//  FAQ2TableController.swift
//  appDicasCulinaria
//
//  Created by Juliana Pereira Machado on 14/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

struct cellData {
    var isOpen : Bool
    var question : String!
    var answer : [String] = [String]()
}

class FAQ2TableController: UITableViewController {
    
    var tableData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableData = [cellData(isOpen: false, question: "Pergunta 1", answer: ["Resposta 1"]),
                     cellData(isOpen: false, question: "Pergunta 2", answer: ["Resposta 2"]),
                     cellData(isOpen: false, question: "Pergunta 3", answer: ["Resposta 3"])]
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData[section].isOpen{
            return tableData[section].answer.count
        }else{
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FAQ2TableViewCell
            cell.lbl_CellTitle.text = tableData[indexPath.section].question!
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FAQ2TableViewCell
            cell.lbl_CellTitle.text = tableData[indexPath.section].answer[indexPath.row]
            return cell
        }
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableData[indexPath.section].isOpen {
            tableData[indexPath.section].isOpen = false
            
            let section = IndexSet.init(integer: indexPath.section)
            
            tableView.reloadSections(section, with: .none)
            
        }else{
            tableData[indexPath.section].isOpen = true
            
            let section = IndexSet.init(integer: indexPath.section)
                       
                       tableView.reloadSections(section, with: .none)
        }
    }
}
