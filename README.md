
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
- [X] Read from local JSON file
    - [X] Best way to store the Date data????
- [ ] Write to json file

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
