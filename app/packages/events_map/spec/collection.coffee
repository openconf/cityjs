expect = chai.expect

describe 'EventsCollection', ->
	EventsCollection = null

	beforeEach (done) ->
		require ['packages/events_map/collection'], (_EventsCollection) ->
			EventsCollection = _EventsCollection
			done()

	it 'should be a function (constructor)', ->
		expect(EventsCollection).to.be.a 'function'

	it 'should be able to fetch data', (done) ->
		collection = new EventsCollection;
		expect(collection).to.be.an 'object'
		collection.fetch
			success: (_events) ->
				done()
			error: ->
				console.log "Can't fetch events data", arguments
