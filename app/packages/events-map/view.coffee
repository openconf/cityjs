define (require, exports, module) ->
	require 'gmaps'

	BaseView = require 'shared/base_view'
	tpl = require 'text!./templates/events.html?t=1'

	class EventsView extends BaseView
		template: _.template(tpl)
		render: ->
			viewData = 
				data:
					developer: 'Andriy & Evgen'
			@$el.html @template viewData
			@_initMap()
			$('#demo-box').html @$el
			@

		_initMap: ->
			$mapEl = @$('#events-map')
			width = $mapEl.css 'width'
			height = $mapEl.css 'height'
			map = new GMaps
				div: $mapEl[0]
				lat: 50.4500
				lng: 30.5233
				width: width
				height: height

			@collection.each (eventModel) ->
				map.addMarker
					lat: eventModel.get 'lat'
					lng: eventModel.get 'lng'
					title: eventModel.get 'name'
					infoWindow:
						content: eventModel.get 'info'
			map.fitZoom()
