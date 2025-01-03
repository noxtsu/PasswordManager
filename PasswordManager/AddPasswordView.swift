//
//  AddPasswordView.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/09/17.
//

import Foundation
import SwiftUI
import SwiftData

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var label: String
    @State private var id: String
    @State private var password: String
    
    init(label: String, id: String, password: String) {
        self.label = label
        self.id = id
        self.password = password
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("ラベル")) {
                    TextEditor(text: $label)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("ログイン名")) {
                    TextEditor(text: $id)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("パスワード")) {
                    TextEditor(text: $password)
                        .autocapitalization(.none)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("追加") {
                        let newPassData = PassData(label: label, id: id, password: password)
                        modelContext.insert(newPassData)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("キャンセル", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}
