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
    @State var title = ""
    @State var date = ""
    var body: some View{
        HStack(alignment: .center, spacing: 1){
        VStack(alignment: .leading){
               ForEach(toDos){ toDo in
               TaskView(toDo: toDo, onDelete: {toDos.removeAll(where: {$0.id == toDo.id})})
               } 
        Spacer()
        AddToDo()
            }
        }
 }
 func AddToDo() -> some View{
            return HStack {
        VStack{
            HStack{
    Text("New to-do: ")
    TextField() {
        title = $0
    }
            }
            HStack{
    Text("Due Date: ")
    TextField() {
        date = $0
            }
        }
        }
    Spacer()
    Button("Save", action: {
        toDos.append(Task(title: title, dueDate: date))
        SaveData(from: toDos)
    })
    
    
    }

    }
 }


