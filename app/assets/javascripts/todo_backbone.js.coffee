window.TodoBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new TodoBackbone.Routers.Tasks()
    Backbone.history.start
      pushState: true
      root: '/main/index'

$(document).ready ->
  TodoBackbone.init()
