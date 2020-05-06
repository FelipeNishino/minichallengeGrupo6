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
    
    //variável para o set final que "guarda" os valores salvos pelo usuário - "seta" a partir das escolhas do usuário na sessão atual
    var setInterests = UserDefaults.Interests
    
    //variável que recebe o set com os valores que o usuário salvou na última sessão - "seta" a partir do computador e usa as escolhas do usuário da última sessão
    var tempSet = UserDefaults.Interests

    let saveButton  = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveInterest))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveInterest))
        self.navigationItem.rightBarButtonItem!.isEnabled = false
                
        //cada botão associa sua tag a um item do set pelo valor da linha
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
        //printa o set temporário
        print(tempSet.debugDescription)
        
        //para cada item no set temporário, a variável tempBtn aloca o botão com a tag correspondente e executa a função para deixá-lo selecionado ou não
        for item in tempSet {
            let tempBtn = self.view.viewWithTag(item) as? UIButton
            
            //verifica se o botão está selecionado
            selectInterest(tempBtn!)
        }
    }
    
    //chama o set de interests dentro do user defaults e seta os valores selecionados pelo usuário; Atribui os valores de setInterests para tempSet e atualiza o estado do botão "Save"
    @objc func saveInterest() {
        UserDefaults.Interests = setInterests
        tempSet = setInterests
        refreshSaveBtn()
    }
    
    @objc func refreshSaveBtn() {
        //se lado A e B (adicionar e remover) não estiverem igualmente vazios (diagrama de Venn), então o usuário selecionou algo para acrescentar -> habilite o botão
        if !setInterests.symmetricDifference(tempSet).isEmpty {
            self.navigationItem.rightBarButtonItem!.isEnabled = true
        }
            
        //lado A e B estão iguais, nada foi adicionado ou removido -> mantenha o botão de save desabilitado
        else {
            self.navigationItem.rightBarButtonItem!.isEnabled = false
        }
    }
    
    @IBAction func selectInterest(_ sender: UIButton) {
        
        //se o background do botão não for verde, ele troca a cor e insere a tag (interesse) no setInterests
        if sender.backgroundColor != #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1){
            sender.backgroundColor = #colorLiteral(red: 0.3575409949, green: 0.8815410733, blue: 0.5376247764, alpha: 1)
            setInterests.insert(sender.tag)
        }
            
        //se o background for verde, ele muda para cinza e remove o interesse do set
        else {
            sender.backgroundColor = .systemGray3
            setInterests.remove(sender.tag)
        }
        refreshSaveBtn()
    }
}

