//
//  Tags.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 05/05/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import Foundation

public struct Category {
    var name : String
    var id : Int
}

extension Category : ExpressibleByStringLiteral {

    internal init(string value: String) {
         let data = Data(value.utf8)

        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            guard let name = json["name"] as? String else {
                self.init(name: "0", id: 0)
                return
            }

            guard let id = json["id"] as? Int else {
                self.init(name: "0", id: 0)
                return
            }

            self.init(name: String(name), id: id)

        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
            self.init(name: "0", id: 0)
        }
    }

    public init(stringLiteral value: String.StringLiteralType) {
        self.init(string: String(value))

    }

    public init(extendedGraphemeClusterLiteral value: String.ExtendedGraphemeClusterLiteralType) {
        self.init(string: String(value))
    }

    public init(unicodeScalarLiteral value: String.UnicodeScalarLiteralType) {
        self.init(string: String(value))
    }
}

extension Category : Equatable {}

public func ==(lhs : Category, rhs: Category) -> Bool {
    return lhs.name == rhs.name &&
        lhs.id == rhs.id
}

public enum Tags : Category, CaseIterable {
    case carnePerfeita = "{\"name\":\"Carne Perfeita\",\"id\":0}"
    case soVeggies = "{\"name\":\"Só Veggies\",\"id\":1}"
    case procedimentosBasicos = "{\"name\":\"Procedimentos Básicos\",\"id\":2}"
    case metodosCoccao = "{\"name\":\"Métodos de Cocção\",\"id\":3}"
    case diaDia = "{\"name\":\"Dia a Dia\",\"id\":4}"
    case substituicoes = "{\"name\":\"Substituições\",\"id\":5}"
    case comoCortar = "{\"name\":\"Como Cortar\",\"id\":6}"
    case vistosRecentemente = "{\"name\":\"Vistos Recentemente\",\"id\":7}"
    case preAquecimento = "{\"name\":\"Pré-aquecimento\",\"id\":8}"
    case massas = "{\"name\":\"Massas\",\"id\":9}"
    
    static func findTag(searchId: Int) -> Tags {
        for Tag in Tags.allCases {
            if Tag.rawValue.id == searchId {
                return Tag
            }
        }
        return Tags.allCases[0]
    }
}
