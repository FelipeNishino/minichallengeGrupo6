//
//  InteressesViewController.swift
//  appDicasCulinaria
//
//  Created by Juliana Pereira Machado on 27/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

class interestsViewController: UIViewController {
    
    var tagSelected = tagsInterests.empty
    
    let saveButton  = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveInterest))
    let cancelButton  = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(saveInterest))
    
    // var buttonsInterests = [UIButton]()
    
    enum tagsInterests {
        case empty
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        checkClicked()
       
            
        
        
    }
    
    @objc func saveInterest() {
        print("salvando...")
        checkClicked()
    }
    
    func checkClicked(){
        if tagSelected != tagsInterests.empty{
            
            self.navigationItem.rightBarButtonItem = saveButton
            self.navigationItem.leftBarButtonItem = cancelButton
            
            switch tagSelected{
                
            case .carnePerfeita:
                if btn_CarnePerfeita.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_CarnePerfeita.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("carne perfeita selecionada")
                }else{
                    btn_CarnePerfeita.backgroundColor = .systemGray6
                    print("carne perfeita desselecionada")
                }
                
            case .soVeggies:
                if btn_SoVeggies.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_SoVeggies.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("só veggies selecionada")
                }else{
                    btn_SoVeggies.backgroundColor = .systemGray2
                    print("só veggies desselecionada")
                }
                
            case .procedimentosBasicos:
                if btn_ProcedimentosBasicos.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_ProcedimentosBasicos.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("procedimentos básicos selecionada")
                }else{
                    btn_ProcedimentosBasicos.backgroundColor = .systemGray3
                    print("procedimentos básicos desselecionada")
                }
                
            case .metodosCoccao:
                if btn_MetodosCoccao.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_MetodosCoccao.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("métodos de cocção selecionada")
                }else{
                    btn_MetodosCoccao.backgroundColor = .systemGray6
                    print("métodos de cocção desselecionada")
                }
                
            case .diaDia:
                if btn_DiaDia.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_DiaDia.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("dia a dia selecionada")
                }else{
                    btn_DiaDia.backgroundColor = .systemGray2
                    print("dia a dia desselecionada")
                }
                
            case .substituicoes:
                if btn_Substituicoes.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_Substituicoes.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("substituições selecionada")
                }else{
                    btn_Substituicoes.backgroundColor = .systemGray3
                    print("substituições desselecionada")
                }
                
            case .comoCortar:
                if btn_ComoCortar.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_ComoCortar.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("como cortar selecionada")
                }else{
                    btn_ComoCortar.backgroundColor = .systemGray4
                    print("como cortar desselecionada")
                }
                
            case .vistosRecentemente:
                if btn_VistosRecentemente.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_VistosRecentemente.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("visto recentemente selecionada")
                }else{
                    btn_VistosRecentemente.backgroundColor = .systemGray3
                    print("visto recentemente desselecionada")
                }
                
            case .preAquecimento:
                if btn_PreAquecimento.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_PreAquecimento.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("pré-aquecimento selecionada")
                }else{
                    btn_PreAquecimento.backgroundColor = .systemGray2
                    print("pré-aquecimento desselecionada")
                }
                
            case .massas:
                if btn_Massas.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
                    btn_Massas.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
                    print("massas selecionada")
                }else{
                    btn_Massas.backgroundColor = .systemGray4
                    print("massas desselecionada")
                }
                
            default:
                print(tagSelected)
            }
        }
        
        
    }
    
    
    
    
    @IBAction func btn_CarnePerfeita(_ sender: UIButton) {
        print("carne")
        tagSelected = tagsInterests.carnePerfeita
        checkClicked()
        
        // buttonsInterests.append(btn_CarnePerfeita)
    }
    
    @IBAction func btn_SoVeggies(_ sender: UIButton) {
        print("veggie")
        tagSelected = tagsInterests.soVeggies
        checkClicked()
    }
    
    @IBAction func btn_ProcedimentosBasicos(_ sender: UIButton) {
        tagSelected = tagsInterests.procedimentosBasicos
        checkClicked()
    }
    
    @IBAction func btn_MetodosCoccao(_ sender: UIButton) {
        tagSelected = tagsInterests.metodosCoccao
        checkClicked()
    }
    
    @IBAction func btn_DiaDia(_ sender: UIButton) {
        tagSelected = tagsInterests.diaDia
        checkClicked()
    }
    
    @IBAction func btn_Substituicoes(_ sender: UIButton) {
        tagSelected = tagsInterests.substituicoes
        checkClicked()
    }
    
    @IBAction func btn_ComoCortar(_ sender: UIButton) {
        tagSelected = tagsInterests.comoCortar
        checkClicked()
    }
    
    @IBAction func btn_VistosRecentemente(_ sender: UIButton) {
        tagSelected = tagsInterests.vistosRecentemente
        checkClicked()
    }
    
    @IBAction func btn_PreAquecimento(_ sender: UIButton) {
        tagSelected = tagsInterests.preAquecimento
        checkClicked()
    }
    
    @IBAction func btn_Massas(_ sender: UIButton) {
        tagSelected = tagsInterests.massas
        checkClicked()
    }
    
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
}

