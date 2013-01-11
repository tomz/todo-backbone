class TodoBackbone.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
    'tasks/:id': 'show'

  initialize: ->
    console.log "TodoBackbone.Routers.Tasks initialize"
    @collection = new TodoBackbone.Collections.Tasks()
    TodoBackbone.collection = @collection
    @collection.fetch
      success: =>
        TodoBackbone.tasksCollection = @collection
        console.log @collection.length

  index: ->
    console.log "TodoBackbone.Routers.Tasks initialize"
    view = new TodoBackbone.Views.TasksIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    console.log "Task #{id}"