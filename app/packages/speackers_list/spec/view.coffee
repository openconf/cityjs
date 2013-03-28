expect = chai.expect

describe 'SpeackersView', ->
	dep = null

	beforeEach (done) ->
		require ['packages/speackers_list/view'], (_dep) ->
			dep = _dep
			done()

	it 'should be test', (done) ->
		done()

	it 'should be funtion', () ->
		expect(dep.View).to.be.a 'function'

	it 'should create view', ->
		expect(new dep.View).to.be.a 'object'

	it 'should render a view', ->
		model = require 'packages/speackers_list/model'
		v = new dep.View model: new model.Speacker
			"name": "a",
			"ava": "img_url"
		v.render() 

		expect(v.$el.find("img").length).to.equal 1