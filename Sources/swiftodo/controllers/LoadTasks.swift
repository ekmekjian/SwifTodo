import Foundation

private func LoadContents() -> Data?{
    let asset = "../assets/Tasks.json"
    if let fileURL = Bundle.main.url(forResource: asset, withExtension: "json"){
        if let contents = try? String(contentsOf: fileURL){
            return Data(contents.utf8)
        }
    }
    return nil
}

func Parse()->[Task]{
    var tasks = [Task]()
    let decoder = JSONDecoder()
    if let data = LoadContents(){
    do{
        let jtasks = try decoder.decode([JTask].self, from: data)
        for task in jtasks{
            tasks.append(Task(title: task.title,id: task.id))
            }
        } catch{
            print(JsonHandler.invalidData(message: "Invalid Content!"))
            }
    }
    return tasks
}
enum JsonHandler: Error{
    case invalidData(message: String)
    }


