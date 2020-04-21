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
        
        tableData = [cellData(isOpen: false, question: "Posso enviar minha próprias dicas?", answer: ["", "No momento ainda não é possível, talvez no futuro isso seja uma funcionalidade."]),
                     cellData(isOpen: false, question: "Como editar meus interesses?", answer: ["", "Para editar seus interesses, basta ir até a tela de Perfil e selecionar Editar interesses. Depois selecione os assuntos de sua preferência e toque em Salvar."]),
                     cellData(isOpen: false, question: "Como faço uma pesquisa?", answer: ["", "Basta acessar acessar a tela Pesquisar e digitar o termo que procura ou selecionar uma palavra-chave"])]
        
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
            cell.lbl_CellTitle.lineBreakMode = .byWordWrapping
            cell.lbl_CellTitle.numberOfLines = 0
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableData[indexPath.section].isOpen{
            return 80
        }else{
            return 40
    }
    }
}
