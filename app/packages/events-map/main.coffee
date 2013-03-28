define (require, exports, module)->
	EventsView = require './view'
	EventsCollection = require './collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes: {
			'events-map': 'renderEventsMap'
		}

		renderEventsMap: ->
			eventsCollection = new EventsCollection
			eventsCollection.fetch
				success: =>
					@renderEventsView(eventsCollection)
			
			#console.log 'going to render events map'
			@

		renderEventsView: (eventsCollection) ->
			@currentView = new EventsView
				collection: eventsCollection
			@currentView.render()

	return
