define (require, exports, module)->
  tpl = require 'text!../templates/organization.html'
  model = require '../models/model'

  exports.View = Backbone.View.extend(
   template: _.template tpl
   model: new model.Model

   initialize: ->

   render: ()->
    @$el.html @template({org: @model.toJSON()})
    return @

  )
  return