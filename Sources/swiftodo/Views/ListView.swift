//
//  File.swift
//  
//
//  Created by Ara on 2/15/23.
//
import SwiftTUI
import Foundation
struct ListView: View{
    // TODO: pull from database
    @State var toDos: [Task] = Parse()
    var body: some View{
        VStack(alignment: .center, spacing: 1){
        VStack(alignment: .center, spacing: 1){
               ForEach(toDos){ toDo in
               TaskView(toDo: toDo, onDelete: {toDos.removeAll(where: {$0.id == toDo.id})})
               } 
            }
        Spacer()
        addToDo
        }

            
}
        private var addToDo: some View {
            HStack {
                Text("New to-do: ")
                    TextField() { toDos.append(Task(title: $0)) }
                Spacer()
        }
    }
}
