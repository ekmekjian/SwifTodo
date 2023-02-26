//
//  File.swift
//  
//
//  Created by Ara on 2/21/23.
//

import Foundation

func SaveData(from tasks: [Task]){
    let encoder = JSONEncoder()
    let path = "/Users/black/Documents/SwifTodo/Tasks.json"
    var saveTasks: [JTask] = []
    for task in tasks {
        saveTasks.append(JTask(task.title, task.id))
    }
    encoder.outputFormatting = .prettyPrinted
    if let encoded = try? encoder.encode(saveTasks){
        let url = URL(filePath: path)
        do{
            try encoded.write(to: url)
        } catch{
            print("Failed to write Data \(error.localizedDescription)")
        }
    }
}
func SaveData(from task: Task){
    let encoder = JSONEncoder()
    let path = "Tasks.json"
    let saveTasks = JTask(task.title,task.id )
    encoder.outputFormatting = .prettyPrinted
    if let encoded = try? encoder.encode(saveTasks){
        let url = URL(filePath: path)
        do{
            try encoded.write(to: url)
        } catch{
            print("Failed to write Data \(error.localizedDescription)")
        }
    }
}
