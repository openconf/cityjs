expect = chai.expect

describe 'EventsView', ->
	EventsView = null
	EventsCollection = null

	beforeEach (done) ->
		require [
			'packages/events_map/view'
			'packages/events_map/collection'
		], (_EventsView, _EventsCollection) ->
			EventsView = _EventsView
			EventsCollection = _EventsCollection
			done()

	_getViewInstance = (collection = new EventsCollection) ->
		view = new EventsView
			collection: collection

	it 'should be a function (constructor)', ->
		expect(EventsView).to.be.a 'function'

	it 'should have listed methods', ->
		view = _getViewInstance()
		expect(view).to.be.an 'object'
		methods = ['render', 'dispose', 'remove', '_initMap']
		for meth in methods
			expect(view).have.a.property meth
			expect(view[meth]).to.be.a 'function'

	it 'should be a function (constructor', ->
		view = _getViewInstance()
		expect(view.render()).to.be.equal view
		expect(view.render().$el.html()).to.contain 'div id="events-map'
