//
//  InteressesViewController.swift
//  appDicasCulinaria
//
//  Created by Juliana Pereira Machado on 27/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

enum Interests : Int {
    case carnePerfeita
    case soVeggies
    case procedimentosBasicos
    case metodosCoccao
    case diaDia
    case substituicoes
    case comoCortar
    case vistosRecentemente
    case preAquecimento
    case massas
}

class interestsViewController: UIViewController {
    
    @IBOutlet weak var btn_CarnePerfeita: UIButton!
    @IBOutlet weak var btn_SoVeggies: UIButton!
    @IBOutlet weak var btn_ProcedimentosBasicos: UIButton!
    @IBOutlet weak var btn_MetodosCoccao: UIButton!
    @IBOutlet weak var btn_DiaDia: UIButton!
    @IBOutlet weak var btn_Substituicoes: UIButton!
    @IBOutlet weak var btn_ComoCortar: UIButton!
    @IBOutlet weak var btn_VistosRecentemente: UIButton!
    @IBOutlet weak var btn_PreAquecimento: UIButton!
    @IBOutlet weak var btn_Massas: UIButton!
    
    var setInterests = UserDefaults.Interests
    let tempSet = UserDefaults.Interests

    
    let saveButton  = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveInterest))
    
    //    let cancelButton  = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(saveInterest))
    
    // var buttonsInterests = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveInterest))
        self.navigationItem.rightBarButtonItem!.isEnabled = false
                
        btn_SoVeggies.tag = Interests.soVeggies.rawValue
        btn_CarnePerfeita.tag = Interests.carnePerfeita.rawValue
        btn_DiaDia.tag = Interests.diaDia.rawValue
        btn_Massas.tag = Interests.massas.rawValue
        btn_ComoCortar.tag = Interests.comoCortar.rawValue
        btn_MetodosCoccao.tag = Interests.metodosCoccao.rawValue
        btn_Substituicoes.tag = Interests.substituicoes.rawValue
        btn_PreAquecimento.tag = Interests.preAquecimento.rawValue
        btn_VistosRecentemente.tag = Interests.vistosRecentemente.rawValue
        btn_ProcedimentosBasicos.tag = Interests.procedimentosBasicos.rawValue
        
        getInterests()
    }
    
    @objc func getInterests() {
        print(tempSet.debugDescription)
        
        for item in tempSet {
            let tempBtn = self.view.viewWithTag(item) as? UIButton
            selectInterest(tempBtn!)
        }
    }
    
    @objc func saveInterest() {
        UserDefaults.Interests = setInterests
    }
    
        
    @IBAction func selectInterest(_ sender: UIButton) {
        if sender.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
            sender.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
            setInterests.insert(sender.tag)
        }
        else {
            sender.backgroundColor = .systemGray6
            setInterests.remove(sender.tag)
        }
        
        if !setInterests.symmetricDifference(tempSet).isEmpty {
            self.navigationItem.rightBarButtonItem!.isEnabled = true
        }
        else {
            self.navigationItem.rightBarButtonItem!.isEnabled = false
        }
    }
}

