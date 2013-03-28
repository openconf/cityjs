expect = chai.expect

describe 'EventModel', ->
	EventModel = null

	beforeEach (done) ->
		require ['packages/events-map/model'], (_EventModel) ->
			EventModel = _EventModel
			done()

	it 'should be a function (constructor', ->
		expect(EventModel).to.be.a 'function'

	it 'should have main methods of Backbone.Model', ->
		model = new EventModel
		expect(model).to.be.an 'object'
		methods = [
			'fetch'
			'save'
			'destroy'
		]
		for meth in methods
			expect(model).to.have.a.property meth
			expect(model[meth]).to.be.a 'function'
		return
		
