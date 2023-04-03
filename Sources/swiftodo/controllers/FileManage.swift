import Foundation

func SaveData(from tasks: [Task]){
    let fm = FileManager()
    let homeUrl = fm.homeDirectoryForCurrentUser
    let configFol = homeUrl.appendingPathComponent(".config/swiftodo")
    let filePath = configFol.appendingPathComponent("Task.json")
    let encoder = JSONEncoder()
    var saveTasks: [JTask] = []
    //check if the directory exists
    FileCheck()
    for task in tasks {
        saveTasks.append(JTask(task.title, task.id,task.dueDate))
    }
    encoder.outputFormatting = .prettyPrinted
    if let encoded = try? encoder.encode(saveTasks){
        let url = filePath
        do{
            try encoded.write(to: url)
        } catch{
            print("Failed to write Data \(error.localizedDescription)")
        }
    }
}


private func LoadContents() -> Data?{
    let fm = FileManager()
    let homeUrl = fm.homeDirectoryForCurrentUser
    let dirPath = homeUrl.appendingPathComponent(".config/swiftodo")
    let filePath = dirPath.appendingPathComponent("Task.json")
    print("load url")
    print(filePath)
    
    do{
        let data = try Data(contentsOf: filePath)
        print("This is what the Data returns: \(data)")
        return data
        }catch{
            print("Failed to load data \(error.localizedDescription)")
        }
    return nil
}

func Parse()->[Task] {
    var tasks = [Task]()
    let decoder = JSONDecoder()
    if let data = LoadContents(){
    do{
        for task in try decoder.decode([JTask].self, from: data){
            tasks.append(Task(title: task.title,id: task.id, dueDate: task.dueDate))
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

func FileCheck(){
    let fm = FileManager()
    var isDir: ObjCBool = false
    let homeUrl = fm.homeDirectoryForCurrentUser
    let configFol = homeUrl.appendingPathComponent(".config/swiftodo")
    let filePath = configFol.appendingPathComponent("Task.json").absoluteString
    //check if configFolder exists
    if(!fm.fileExists(atPath: configFol.absoluteString, isDirectory: &isDir) || !isDir.boolValue){
        do{
            try fm.createDirectory(atPath: configFol.absoluteString, withIntermediateDirectories: true, attributes: nil)
            fm.createFile(atPath: filePath, contents: nil)
        } catch{
            print("Failed to create directory \(error.localizedDescription)")
        }
    }
    if(!fm.fileExists(atPath: filePath)){fm.createFile(atPath: filePath, contents: nil)}
}
//this is a test of comments
