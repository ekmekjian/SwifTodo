import SwiftTUI
import Foundation
struct AddToDo: View {
    @State var toDos: [Task]
    @State var title = ""
    @State var date = ""
    var body: some View{
            HStack {
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
