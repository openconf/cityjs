define (require, exports, module)->
	view = require './view'
	view_meetup = require './view_meetup'

	collection_meetups = require './collection_meetups'

	model_meetup = require './model_meetup'

	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'shedule': 'shedule'
			'shedule/:id': 'meetup'

		shedule: ->
			console.log "shedule page"
			@sheduleView = new view.View(
				meetups: new collection_meetups.Meetups()
			)

			$('#shedule-box').html @sheduleView.render().$el

			return @

		meetup: ->
			console.log "meetup page"
			@meetupView = new view_meetup.View(
				meetup: new model_meetup.Meetup()
			)
			$('#shedule-box').html @meetupView.render().$el

			return @

	return