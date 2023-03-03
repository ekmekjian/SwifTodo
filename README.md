:
## Design (CLI Implementation)

### Models

- Task:
- Json Codable Tasks:

#### Task

- [X] Title
- [ ] DueDate
- [ ] Duration
- [ ] Priortiy

### Views

- [X] ListView to create layout of the tasks:
- [ ] TaskView, layout view for a task:
  - [ ] Finish Task model properties

### Controllers

- [X] Accepts JSON into Task
- [X] Completing tasks:
  - [X] When a task is compelted remove from the json

#### Due Date Controller

- [ ] keeps tracks of all Task.dueDate
- [ ] Interpret dueDate property JSON

#### Database Controller

- [ ] Check if the json file exists otherwise create it
- [X] Delete a task and update the JSON
- [X] Read from local JSON file
  - [X] Best way to store the Date data????
- [o] Devlop data cycle?( I don't know how to say this):
  - [X] When a task is added save to the Database
  - [ ] Check that a new task doesn't duplicate
  - [X] ? Create a new .json file each time???(No can now read and write)

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
