import Foundation

struct DateParser{
   let formatter: DateFormatter
   let timeFormatter: DateFormatter
   let isoFormatter: ISO8601DateFormatter
   init(){
      formatter = DateFormatter()
      timeFormatter = DateFormatter()
      formatter.timeZone = TimeZone.current
      timeFormatter.timeZone = TimeZone.current
      timeFormatter.locale = Locale(identifier: "en_US_POSIX")
      formatter.locale = Locale(identifier: "en_US_POSIX")
      isoFormatter = ISO8601DateFormatter()
      isoFormatter.timeZone = TimeZone.current
   }
   mutating func parseTime(taskDate: String) -> String {
   //Format for getting time
   var time = ""
   formatter.dateFormat = "HH:mm"
   let stringed = formatter.string(from:toISO8601(taskDate: taskDate))
    if let dateStr = formatter.date(from: stringed) {
    formatter.dateFormat = "h:mm a"
    time = formatter.string(from: dateStr)
    }
   return time 
}
func parseDate(taskDate: String) -> String {
    //Format for getting date
    var date = ""
    formatter.dateFormat = "yyyy-MM-dd"
   let stringed = formatter.string(from:toISO8601(taskDate: taskDate))
    if let dateStr = formatter.date(from: stringed) {
    date = formatter.string(from: dateStr)
    }
    return date
   }
func isoTostring(date: String,time: String) -> String{
    let isoDateForm = DateFormatter()
    isoDateForm.dateFormat = "yyyy-MM-dd'T'HH:mm"
    isoDateForm.timeZone = TimeZone.current
    isoDateForm.locale = Locale(identifier: "en_US_POSIX")
    var iso: String = ""
    if let isoDate = isoDateForm.date(from: date+"T"+time){
        iso = isoFormatter.string(from: isoDate)
    }
    return iso
}
func toISO8601(taskDate: String) -> Date{
    let isoDateForm = DateFormatter()
        isoDateForm.dateFormat = "yyyy-MM-dd'T'HH:mm"
        isoDateForm.timeZone = TimeZone.current
        isoDateForm.locale = Locale(identifier: "en_US_POSIX")
    var iso = Date()
    if let isoDate = isoDateForm.date(from: taskDate){
        print("do we get here")
      iso = isoDate
  }
    return iso
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
