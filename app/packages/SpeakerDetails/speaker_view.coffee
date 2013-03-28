define (require, exports, module)->
	template = require 'text!./templates/speaker.html'

	exports.SpeakerView = Backbone.View.extend(
		template: _.template template

		render: ->
			@$el.html @template(@model.toJSON())
			@
	)

	return