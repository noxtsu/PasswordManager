//
//  ContentView.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/05/12.
//

import SwiftUI
import CoreData

struct ContentView: View, InputViewDelegate {
    // CoreData参照のviewContet(CoreData使用時に必要？)
    @Environment(\.managedObjectContext) var viewContext
    @State var todos: [String] = []
    
    @FetchRequest(sortDescriptors: [])
    var passData: FetchedResults<PassData>
    
    //
    var body: some View {
        NavigationView {
            ZStack {
                
                List {
                    ForEach(passData, id: \.self) { passData in
                        if((passData.name?.isEmpty) == false) {
                            Text(passData.name!)
                        }
                    }
                    
                    Button(action: addPassData) {
                        Text("人間を増やす")
                    }
                }
                
                NavigationLink(destination: InputView(delegate: self, text: "")) {
                    Text("Add")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 20))
                }
                .frame(width: 60, height: 60)
                .background(Color.orange)
                .cornerRadius(30)
                .padding()
                
                
            }
            .onAppear {
                if let todos = UserDefaults.standard.array(forKey: "TODO") as? [String] {
                    self.todos = todos
                }
            }
            .navigationTitle("Password Manager")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        print(todos)
        UserDefaults.standard.setValue(todos, forKey: "TODO")
    }
    
    func addTodo(text: String) {
        todos.append(text)
        UserDefaults.standard.setValue(todos, forKey: "TODO")
    }
    
    func addPassData() {
        let newHuman = PassData(context: viewContext)
        newHuman.name = "五十嵐"
        
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
}

protocol InputViewDelegate {
    func addTodo(text: String)
}

struct InputView: View {
    @Environment(\.presentationMode) var presentation
    let delegate: InputViewDelegate
    @State var text: String
    var body: some View {
        VStack(spacing: 16) {
            TextField("Input Your TODO", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                delegate.addTodo(text: text)
                presentation.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


