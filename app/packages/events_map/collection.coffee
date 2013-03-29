define (require, exports, module) ->
	EventModel = require './model'

	class EventsCollection extends Backbone.Collection
		url: '/api/events'
		model: EventModel
