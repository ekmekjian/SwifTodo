import Foundation
struct DueDate{
   let today = Date() 
   let taskDate: Date
   let formatter = DateFormatter()
   init(from: String){
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm" 
      taskDate = formatter.date(from: from)!
   }
}
extension Date {
    func get(components: Calendar.Component...,calendar: Calendar = Calendar.current) -> DateComponents{
      return calendar.dateComponents(Set(components), from: self)
    }
    func get(component: Calendar.Component,calendar: Calendar = Calendar.current) -> Int{
      return calendar.component(component, from: self)
    }
}