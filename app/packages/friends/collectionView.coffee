define (require, exports, module)->

	BaseView = require 'shared/base_view'
	view = require './view'

	exports.View = class CollectionView extends BaseView

		render: ->
			@$el = $("<ul class='thumbnails'></ul>")
			@collection.fetch success: =>
				for model in @collection.models
					friend = @collection.get model
					_view = new view.View model:friend
					@$el.append(_view.render().$el)
				return @
			return @
	return