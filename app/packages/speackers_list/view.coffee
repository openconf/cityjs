define (require, exports, module) ->
	tpl = require 'text!./templates/speacker.html'

	exports.View = class View extends Backbone.View
		template: _.template tpl

		render: ->
			@$el.html @template speacker:@model.toJSON()
			return @
	return