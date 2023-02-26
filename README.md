
## Design (CLI Implementation)
### Models
- Task:
- Json Codable Tasks:
#### Task
- [X] Title
- [ ] DueDate
- [ ] Duration
- [ ] Priortiy
### Views:
- [ ] ListView to create layout of the tasks:
- [ ] TaskView, layout view for a task
### Controllers
- [X] Accepts JSON into Task 
- [ ] Completing tasks:
    - [ ] When a task is compelted remove from the json
#### Due Date Controller
- [ ] keeps tracks of all Task.dueDate
- [ ] Interpret dueDate property JSON
#### Database Controller
- [X] Read from local JSON file
    - [X] Best way to store the Date data????
- [ ] Devlop data cycle?( I don't know how to say this):
    - [ ] When a task is added save to the Database
    - [ ] Check that a new task doesn't duplicate
    - [ ] ? Create a new .json file each time???
---
## Notes
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
