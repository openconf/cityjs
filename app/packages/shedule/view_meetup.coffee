define (require, exports, module) ->
	tpl = require 'text!./templates/meetup.html'

	BaseView = require 'shared/base_view'

	exports.View = class MyView extends BaseView
		template: _.template tpl

#		events:
#			'click #demo-open': 'showNotification'

		initialize: (meetup)->
			@meetup = meetup.meetup
			#			Backbone.Validation.bind(this) if @model?
			return

		render: =>
			console.log "Meetup"
			console.log @meetup

			@meetup.fetch "1", -> # FIXME
				success: =>
					console.log "Meetups fetched"
					console.log @meetups
					@$el.html @template
					            data:
						            meetup: @meetup.attributes
				error: ->
					console.log "err"
					console.log arguments

			return @


	return