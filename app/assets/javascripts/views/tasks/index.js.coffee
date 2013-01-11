class TodoBackbone.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events:
    'submit #new_task': 'createTask'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTask, this)
    @collection.on('remove', @render, this)

  render: =>
    console.log "tasks index render"
    $(@el).html(@template())
    @collection.each(@appendTask)
    this

  appendTask: (task) ->
    view = new TodoBackbone.Views.Task(model: task)
    $('#tasks').append(view.render().el)

  createTask: (event) ->
    console.log "createTask called"
    event.preventDefault()
    attributes =
      title: $('#new_task_title').val()
      completed: false
    console.log attributes

    @collection.create attributes,
      wait: true
      success: -> $('#new_task')[0].reset()
      error: @handleError

  handleError: (task, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
