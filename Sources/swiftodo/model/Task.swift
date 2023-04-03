import Foundation
import SwiftTUI
struct Task: Identifiable{
    var title: String
    var dueDate: String 
    var id: Int
    init(title: String, id: Int = Int.random(in:1...100), dueDate: String = " "){
        self.title = title
        self.id = id
        self.dueDate = dueDate
        }
    }


