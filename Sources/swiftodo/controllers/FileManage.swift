import Foundation

func SaveData(from tasks: [Task]){
    let fm = FileManager()
    let homeUrl = fm.homeDirectoryForCurrentUser
    let configFol = homeUrl.appendingPathComponent(".config/swiftodo")
    let filePath = configFol.appendingPathComponent("Task.json")
    let encoder = JSONEncoder()
    var saveTasks: [JTask] = []
    let dateParser = DateParser()
    //check if the directory exists
    FileCheck()
    for task in tasks {
        saveTasks.append(JTask(task.title, task.id,dateParser.isoTostring(date: task.date, time: task.time)))
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
    FileCheck()
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
    var dateParser = DateParser()
    if let data = LoadContents(){
    do{
        for task in try decoder.decode([JTask].self, from: data){
            tasks.append(Task(title: task.title,id: task.id, date:dateParser.parseDate(taskDate: task.dueDate), time: dateParser.parseTime(taskDate: task.dueDate)))
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

func FileCheck(){
    let fm = FileManager()
    var isDir: ObjCBool = false
    let homeUrl = fm.homeDirectoryForCurrentUser
    let configFol = homeUrl.appendingPathComponent(".config")
    let swiftodo = configFol.appendingPathComponent("swiftodo")
    let filePath = swiftodo.appendingPathComponent("Task.json").path
    //check if configFolder exists
    if (fm.fileExists(atPath: configFol.path, isDirectory: &isDir) && isDir.boolValue){
        if isDir.boolValue{
            //check if swiftodo exists
            if fm.fileExists(atPath: swiftodo.path, isDirectory: &isDir){
                if isDir.boolValue{
                    //check if Task.json exists
                    if fm.fileExists(atPath: filePath, isDirectory: &isDir){
                        if !isDir.boolValue{
                        }
                    }else{
                        //create Task.json
                        fm.createFile(atPath: filePath, contents: nil, attributes: nil)
                    }
                }
            }else{
                //create swiftodo
                do{
                    try fm.createDirectory(at: swiftodo, withIntermediateDirectories: true, attributes: nil)
                    fm.createFile(atPath: filePath, contents: nil, attributes: nil)
                }catch{
                    print("Failed to create swiftodo directory")
                }
            }
        }
}
}
//this is a test of comments
