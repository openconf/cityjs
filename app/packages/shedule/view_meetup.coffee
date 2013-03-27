define (require, exports, module) ->
	tpl = require 'text!./templates/meetup.html'

	BaseView = require 'shared/base_view'

	exports.View = class MyView extends BaseView
		template: _.template tpl

		initialize: (meetup)->
			@meetup = meetup.meetup
			return

		render: =>
			@meetup.fetch "1", -> # FIXME
				success: =>
					@$el.html @template
					            data:
						            meetup: @meetup.attributes
				error: ->
					console.log "err"
					console.log arguments

			@


	return