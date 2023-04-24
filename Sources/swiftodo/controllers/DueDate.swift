struct DueDate{
    var time: String
    var date: String
    init(){
            time = ""
            date = ""
        }
    init(date: String, time: String = ""){
        let parser = DateParser()
        self.date = date
        self.time = time
        }
    }
