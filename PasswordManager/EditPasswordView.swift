//
//  EditPasswordView.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/09/17.
//

import SwiftData
import SwiftUI

struct EditNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var password: PassData
    
    var body: some View {
        Form {
            Section(header: Text("ラベル")) {
                TextEditor(text: $password.label)
            }

            Section(header: Text("ログイン名")) {
                TextEditor(text: $password.id)
            }
            
            Section(header: Text("パスワード")) {
                TextEditor(text: $password.password)
            }
            
            Section {
                Button("削除", role: .destructive) {
                    modelContext.delete(password)
                    
                    dismiss()
                }
            }
        }
    }
}

