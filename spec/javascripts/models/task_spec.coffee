describe "Task Model", ->

  it "should exist", ->
    expect(TodoBackbone.Models.Task).toBeDefined()

  it "should have title field", ->
    task = new TodoBackbone.Models.Task()
    task.set("title", "Attend DCRUG")
    expect(task.get("title")).toEqual "Attend DCRUG"
