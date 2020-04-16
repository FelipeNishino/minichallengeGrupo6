//
//  FAQ3ViewController.swift
//  appDicasCulinaria
//
//  Created by Juliana Pereira Machado on 16/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class FAQ3ViewController: UIViewController {
    
    @IBOutlet weak var tbl_FAQView: UITableView!
    
    var data = [DataFAQ(titleQuestion: "Pergunta", textAnswer: ["Resposta"], isOpened: false),
                DataFAQ(titleQuestion: "Pergunta 2", textAnswer: ["Resposta 2"], isOpened: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl_FAQView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

extension FAQ3ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let faqQuestionView = FAQQuestionView(frame: CGRect(x: 0, y: 0, width: tbl_FAQView.frame.size.width, height: 40))
        faqQuestionView.delegate = self
        faqQuestionView.secondIndex = section
        faqQuestionView.btnFAQ.setTitle(data[section].titleQuestion, for: .normal)
        return faqQuestionView
    }
    
    //total de seções
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //total de itens em cada seção
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isOpened{
        return data[section].textAnswer.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data[indexPath.section].isOpened{
            return 40
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells")
        cell?.textLabel?.text = data[indexPath.section].textAnswer[indexPath.row]
        return cell!
    }
}

extension FAQ3ViewController: QuestionFAQDelegate{
    func cellQuestionFAQ(index: Int) {
        data[index].isOpened = !data[index].isOpened
        tbl_FAQView.reloadSections([index], with: .automatic)
    }
    
    
}


