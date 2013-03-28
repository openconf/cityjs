define (require, exports, module)->
	tpl = require 'text!./templates/partner.html'

	exports.View = class View extends Backbone.View
		template: _.template tpl

		initialize: ->
			Backbone.Validation.bind(this) if @model?
			return

		render: ->
			@$el = @template partner:@model.toJSON()
			return @
	return