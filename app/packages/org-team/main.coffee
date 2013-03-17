define (require, exports, module)->
  orgsView = require './views/organizations'
  orgView = require './views/organization'
  BaseController = require 'shared/base_controller'

  exports.Controller = class Controller extends BaseController
    routes:
      'org-team': 'getOrgsTeam'
      'org-team/:id': 'getOrgTeam'

    getOrgsTeam: ->
      @orgsView = new orgsView.View
      @orgsView.collection.fetch
        success: (collection, resp, options) =>
          console.dir(collection)
          $('#demo-box').html @orgsView.render().el
      return @

    getOrgTeam: (id)->
      @orgView = new orgView.View()
      @orgView.model.set {id: id}
      @orgView.model.fetch
        success: (model, resp, options) =>
          $('#demo-box').html @orgView.render().el
      return @

  return