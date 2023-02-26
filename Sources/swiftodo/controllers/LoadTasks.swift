import Foundation
private func LoadContents() -> Data?{
    let path = "/Users/black/Documents/SwifTodo/Tasks.json"
    let url = URL(filePath: path)
    print(url)
        if let contents = try? String(contentsOf: url){
            print("do we load the contents")
            return Data(contents.utf8)
        }
    
    return nil
}

func Parse()->[Task] {
    var tasks = [Task]()
    let decoder = JSONDecoder()
    if let data = LoadContents(){
    do{
        let jtasks = try decoder.decode([JTask].self, from: data)
        for task in jtasks{
            print(task)
            tasks.append(Task(title: task.title,id: task.id))
            }
        } catch{
             print(JsonHandler.invalidData(message: "Invalid Content!"))
            }
    }
    print("but we do return")
    return tasks
}
enum JsonHandler: Error{
    case invalidData(message: String)
    }


