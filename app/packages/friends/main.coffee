define (require, exports, module)->
	view = require './collectionView'
	collection = require './collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'friends': 'friends'

		friends: ->
			@currentView = new view.View
				collection:new collection.Friends()
			$('#friend-box').html @currentView.render().$el
			return @
	return
