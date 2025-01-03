//
//  Password.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/09/17.
//

import SwiftData

@Model
class PassData {
    var label: String
    var id: String
    var password: String
    
    init(label: String, id: String, password: String) {
        self.label = label
        self.id = id
        self.password = password
    }
}
