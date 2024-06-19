//
//  ContentView.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/05/12.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var passData: FetchedResults<PassData>
    
    var body: some View {
        List {
            ForEach(passData) { human in
                if((human.name?.isEmpty) == false) {
                    Text(human.name!)
                }
            }
            
            Button(action: addPassData) {
                Text("人間を増やす")
            }
        }
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
#Preview {
    ContentView()
}


