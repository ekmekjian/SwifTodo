import Foundation
import SwiftTUI
struct Task: Identifiable{
    var title: String
    var date: String
    var time: String
    var id: Int
    init(title: String, id: Int = Int.random(in:1...100), date: String = "", time: String = ""){
        self.title = title
        self.id = id
        self.date = date
        self.time = time
        }
    }


