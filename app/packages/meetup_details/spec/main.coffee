expect = chai.expect

describe 'Main meetup test', ->
	dep = null
	Controller = null


	beforeEach (done) ->
		require ['packages/meetup_details'], (_dep) ->
			Controller = _dep.Controller
			done()

	it 'should be controler', ->
		expect(Controller).to.be.a 'function'
		BaseController = require 'shared/base_controller'
		c = new Controller()
		expect(c instanceof BaseController).to.be.ok

	it 'should have a metup rout', ->
		c = new Controller()
		expect( c.meetup_details ).to.be.a 'function'