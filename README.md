
## Design (CLI Implementation)
### Models
#### Task
- [ ] Title
- [ ] DudeDate
- [ ] Duration
- [ ] Priortiy
### Controllers
## View
- [ ] Accepts JSON into Task 
#### Due Date Controller
- [ ] keeps tracks of all Task.dueDate
- [ ] Interpret dueDate property JSON
#### Database Controller
- [ ] Read from local JSON file
    - [ ] Best way to store the Date data????

---
There are 86400 seconds in a day
 Whether it's HStack or VStack each take an alignment paramter `(alignment:.center){`:
 - .center(Center the elements)
 - .leading(lean them towards the front)
 - .trailing(lean them towards the end)
We can hide elements and reveal if conditions are met:
```swift
if counter > 1 {
    Button("Remove number") { counter -= 1 }
}
```
## Example:
```swift
    @State var counter = 1
     var body: some View {
    VStack(alignment:.center){
    Button("Add number") { counter += 1 }
    if counter > 1 {
        Button("Remove number") { counter -= 1 }
    }
    HStack{
    VStack {
        ForEach(1 ... counter, id: \.self) { i in
            Text("Number \(i)")
        }
        .border()
    }
    .padding()
    Spacer()
    VStack{
    ForEach(1 ... counter, id: \.self) { i in
        Text("Number \(i)")
    }.border()
    }.padding()
    }.padding()
    }.padding()
    }
```
