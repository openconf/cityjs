define (require, exports, module)->
	BaseController = require 'shared/base_controller'

	view = require './view'
	view_meetup = require './view_meetup'
	collection_meetups = require './collection_meetups'
	model_meetup = require './model_meetup'

	exports.Controller = class Controller extends BaseController
		routes:
			'shedule': 'shedule'
			'shedule/:id': 'meetup'

		shedule: ->
			@sheduleView = new view.View
				meetups: new collection_meetups.Meetups()

			$('#shedule-box').html @sheduleView.render().$el
			@

		meetup: ->
			@meetupView = new view_meetup.View
				meetup: new model_meetup.Meetup()

			$('#shedule-box').html @meetupView.render().$el
			@

	return