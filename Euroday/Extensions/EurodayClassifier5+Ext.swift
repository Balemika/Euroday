//
//  EurodayClassifier5+Ext.swift
//  Euroday
//
//  Created by Ņikita Roldugins on 26/02/2022.
//

// Fixes warning with implementing ML model

import Foundation

extension EurodayClassifier5 {
    convenience init(_ foo: Void) {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }
}
