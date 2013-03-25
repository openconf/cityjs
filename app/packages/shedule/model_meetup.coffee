define (require, exports, module)->
	exports.Meetup = class MeetupModel extends Backbone.Model
		url: '/shedule/meetup/'
		defaults:
			id: 0
			title: 'Meetup name'
			description: 'Short description of meetup.'
			city: 'The city of meetup'
			place: 'Short comments for meetup place. Room number, street etc.'
			reports: []

	return