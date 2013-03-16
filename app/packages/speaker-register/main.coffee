define (require, exports, module)->
	view = require './view'
	model = require './model'
	collection = require './collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'speaker-register': 'register'

		register: ->
			console.log('speaker-register');
			@eventsColl = new collection.Collection();
			@eventsColl.fetch
				success: (coll, response, options) ->
					@currentView = new view.View(
						model: new model.Model()
						collection: coll
					)
					$('#demo-box').html @currentView.render().$el

			return @
	return