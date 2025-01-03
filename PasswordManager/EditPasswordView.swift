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
                HStack {
                    TextEditor(text: $password.id)
                    Button {
                        // TODO ボタンタップのレスポンス追加する
                        UIPasteboard.general.string = $password.id
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .font(.title)
                            .frame(width: 15, height: 15)
                    }
                }
            }
            
            Section(header: Text("パスワード")) {
                HStack {
                    TextEditor(text: $password.password)
                    Button {
                        // TODO ボタンタップのレスポンス追加する
                        UIPasteboard.general.string = $password.id
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .font(.title)
                            .frame(width: 15, height: 15)
                    }
                }
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

