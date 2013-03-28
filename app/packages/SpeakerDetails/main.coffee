define (require, exports, module)->
	view = require './view'
	model = require './model'
	collection = require './collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes: 
			'speakers': 'show'

		show: ->
			@currentView = new view.SpeakersView(
				collection: new collection.Collection()
			)
			$('#speakers-box').html @currentView.render().$el
			
	return

