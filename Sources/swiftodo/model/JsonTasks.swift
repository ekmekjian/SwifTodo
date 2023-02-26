struct JTask: Codable{
    var title: String
    var id : Int
    public init(_ title: String,_ id: Int){
        self.title = title
        self.id = id
        }
}
