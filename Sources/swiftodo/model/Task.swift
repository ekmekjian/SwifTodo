import Foundation
import SwiftTUI
struct Task: Identifiable{
    var title: String
    // var dueDate: Date
    var id: Int
    // var done: Bool
    init(title: String, id: Int = Int.random(in:1...100)){
        self.title = title
        self.id = id
    }
}

