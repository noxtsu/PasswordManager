//
//  ContentView.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/09/17.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var passData: [PassData]
    @State private var isShowAddView = false
    
    var body: some View {
        NavigationStack {
            List(passData) { password in
                NavigationLink {
                    EditNoteView(password: password)
                } label: {
                    VStack(alignment: .leading) {
                        Text(password.label)
                        Text(password.id)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .sheet(isPresented: $isShowAddView) {
                NavigationStack {
                    AddNoteView(label: "", id: "", password: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isShowAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
