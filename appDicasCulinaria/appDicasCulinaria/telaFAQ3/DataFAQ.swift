//
//  DataFAQ.swift
//  appDicasCulinaria
//
//  Created by Juliana Pereira Machado on 16/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import Foundation

class DataFAQ {
    
    var titleQuestion: String?
    var textAnswer = [String]()
    var isOpened: Bool = false


init(titleQuestion: String, textAnswer: [String], isOpened: Bool){
    
    self.titleQuestion = titleQuestion
    self.textAnswer = textAnswer
    self.isOpened = isOpened
    }
    
}
