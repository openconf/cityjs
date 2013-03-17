define (require, exports, module) ->
  model = require '../models/model'
  exports.Collection = Backbone.Collection.extend(
     url: ->
      '/org'

     model: model.Model
  )
  return