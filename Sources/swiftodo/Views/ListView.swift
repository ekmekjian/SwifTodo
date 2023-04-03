//
//  File.swift
//  
//
//  Created by Ara on 2/15/23.
//
import SwiftTUI
import Foundation
struct ListView:  View{
    // TODO: pull from database
    @State var toDos: [Task] = Parse()
    var body: some View{
        HStack(alignment: .center, spacing: 1){
        VStack(alignment: .leading){
               ForEach(toDos){ toDo in
               TaskView(toDo: toDo, onDelete: {toDos.removeAll(where: {$0.id == toDo.id})})
               } 
        Spacer()
        AddToDo(toDos: toDos)
            }
        }
 }
}


