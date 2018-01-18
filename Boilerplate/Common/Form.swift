//
//  Form.swift
//  Boilerplate
//
//  Created by Do Dinh Thy  Son  on 1/5/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import UIKit

protocol Field {
    associatedtype FT
    var value : FT { get }
}

extension Field {
    var lazyValue : (() -> FT) {
        return { self.value }
    }
}

extension UITextField : Field {
    typealias FT = String
    var value : String {
        return text ?? ""
    }
}

class AnyField<FieldType> : Field {
    typealias FT = FieldType
    let valueBlock : (() -> (FieldType))
    var value: FieldType {
        return valueBlock()
    }
    init<F: Field>(_ field: F) where F.FT == FieldType {
        self.valueBlock = field.lazyValue
    }
}

//struct Form {
//    typealias ValidationBlock = ([Any]) -> (Bool)
//    var fields : [AnyField] = []
//    var validationBlock : ValidationBlock?
//    var isValid : Bool {
//        return validationBlock?(fields) ?? true
//    }
//
//    mutating func add<F : Field>(_ field: F) -> Form{
//        fields.append(field)
//        return self
//    }
//
//    mutating func validation(validationBlock: @escaping ValidationBlock){
//        self.validationBlock = validationBlock
//    }
//}

