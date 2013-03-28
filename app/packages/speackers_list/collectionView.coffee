define (require, exports, module)->

	view = require './view'

	exports.View = class CollectionView extends Backbone.View

		render: ->
			@$el = $("<ul class='speackers'></ul>")
			@collection.fetch success: =>
				for model in @collection.models
					speacker = @collection.get model
					console.log speacker
					_view = new view.View model:speacker
					@$el.append(_view.render().$el)
				return @
			return @
	return