expect = chai.expect

describe 'Controller', ->
	Controller = null

	beforeEach (done) ->
		require ['packages/events_map'], (_package) ->
			Controller = _package.Controller
			done()

	it 'should be a function (constructor)', ->
		expect(Controller).to.be.a 'function'

	it 'should have listed routes', ->
		controller = new Controller
		expect(controller).to.be.an 'object'
		expect(controller).to.have.a.property 'routes'
		expect(controller.routes).to.be.an 'object'
		expect(controller.routes).to.be.deep.equal
			'events-map': 'renderEventsMap'
