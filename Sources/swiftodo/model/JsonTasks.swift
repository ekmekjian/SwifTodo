struct JTask: Codable{
    var title: String
    var id : Int
    var dueDate: String = ""
    public init(_ title: String,_ id: Int,_ dueDate: String = ""){
        self.title = title
        self.id = id
        }
}
