expect = chai.expect
should = chai.should()

describe 'Meetup model tests', ->
	Model = null

	beforeEach (done) ->
		require ['packages/meetup_details/model'], (_dep) ->
			Model = _dep
			done()

	it 'should be a Model', () ->
		expect( Model ).to.be.a 'function'

		m = new Model()
		expect( m instanceof Backbone.Model ).to.be.ok

	it 'should have default data', () ->
		m = new Model()
		expect( m.defaults ).to.be.an('object')

	it 'should have at least name, city and address default fields', () ->
		m = new Model()
		m.defaults.should.have.property 'name'
		m.defaults.should.have.property 'city'
		m.defaults.should.have.property 'address'