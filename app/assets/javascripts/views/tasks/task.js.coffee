class TodoBackbone.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'li'

  events:
    'click .delete': 'deleteTask'
    'click': 'completeTask'

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    $(@el).html(@template(task: @model))
    this

  showTask: ->
    Backbone.history.navigate("tasks/#{@model.get('id')}", true)

  deleteTask: ->
    @model.destroy()

  completeTask: ->
    @model.set("completed", not @model.get("completed"))
