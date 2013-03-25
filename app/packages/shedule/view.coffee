define (require, exports, module) ->
	tpl = require 'text!./templates/shedule.html'

	BaseView = require 'shared/base_view'

	exports.View = class MyView extends BaseView
		template: _.template tpl

#		events:
#			'click #demo-open': 'showNotification'

		initialize: (meetups)->
			@meetups = meetups.meetups
#			Backbone.Validation.bind(this) if @model?
			return

		render: =>
			console.log "Meetups"
			@meetups.fetch
				success: =>
					console.log "Meetups fetched"
					console.log @meetups
					@$el.html @template
					  data:
						  meetups: @meetups.models
				error: ->
					console.log "err"
					console.log arguments

			return @


	return