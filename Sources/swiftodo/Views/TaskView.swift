import SwiftTUI
import Foundation
struct TaskView: View{
    let toDo: Task
    let onDelete: () -> Void
    @State var deleting = false

    var body: some View{
        HStack{
            HStack{
                Text(toDo.title)
                VStack{
                        //due 
                        //duration
                    }
                Spacer()
                VStack(alignment:.trailing){
            if deleting{
                    Text("[x]")
                }else{
                    Button("[ ]", action: delete)
                    }
                    }
            }
                }
            }
    
    private func delete(){
        deleting = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)){
            onDelete()
            }
        }
}
