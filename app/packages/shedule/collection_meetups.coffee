define (require, exports, module) ->

	Meetup = require './model_meetup'
	Report = require './model_report'

	exports.Meetups = class MeetupsCollection extends Backbone.Collection
		url: "/shedule/meetups/"
		model: Meetup.Meetup

		parse: (meetups) ->
			for meetup in meetups
				reports = []
				for report in meetup.reports
					reports.push new Report.Report report
				meetup.reports = reports
			meetups

	return