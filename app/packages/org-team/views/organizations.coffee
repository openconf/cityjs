define (require, exports, module)->
  tpl = require 'text!../templates/organizations.html'
  collection = require '../collections/collection'

  exports.View = Backbone.View.extend(
    template: _.template tpl
    collection: new collection.Collection

    initialize: ->

    render: ->
      @$el.html @template(listOrg: @collection.toJSON())
      return @
  )
  return