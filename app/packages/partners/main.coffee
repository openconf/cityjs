define (require, exports, module)->
	view = require './collectionView'
	model = require './model'
	collection = require './collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'partners': 'partners'

		partners: ->
			console.log 'partners'
			@currentView = new view.View
				collection:new collection.Partners()
			$('#demo-box').parent().html @currentView.render().$el
			return @

	return