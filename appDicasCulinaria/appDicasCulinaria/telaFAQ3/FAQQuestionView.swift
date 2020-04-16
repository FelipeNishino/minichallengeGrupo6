//
//  FAQQuestionView.swift
//  appDicasCulinaria
//
//  Created by Juliana Pereira Machado on 16/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

protocol QuestionFAQDelegate {
    func cellQuestionFAQ(index: Int)
}

class FAQQuestionView: UIView {
    
    var secondIndex: Int?
    var delegate: QuestionFAQDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btnFAQ)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btnFAQ: UIButton = {
        let btnFAQ = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btnFAQ.titleLabel?.textColor = UIColor.black
        btnFAQ.clipsToBounds = true
       btnFAQ.addTarget(self, action: #selector(onClickFAQQuestionView), for: .touchUpInside)
        return btnFAQ
    }()
    
    @objc func onClickFAQQuestionView(){
        
        if let index = secondIndex{
            delegate?.cellQuestionFAQ(index: index)
        }
    }
}
