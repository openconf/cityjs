define (require, exports, module)->

	view = require './view'

	exports.View = class CollectionView extends Backbone.View

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