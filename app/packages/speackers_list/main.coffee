define (require, exports, module)->
	view = require './collectionView'
	collection = require './collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes: 
			"speackers": "initSpeackers"

		initSpeackers: ->
			console.log 1
			@currentView = new view.View
				collection:new collection.Speackers()
			$('#demo-box').parent().html @currentView.render().$el
			return @
	return