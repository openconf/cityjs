define (require, exports, module) ->
	tpl = require 'text!./templates/meetup.html'

	class View extends Backbone.View
		template: _.template tpl

		initialize: ->
			return

		render: ->			
			@$el = @template meetup: @model.toJSON()
			@
			