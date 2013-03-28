expect = chai.expect

describe 'SpeackersColectionView', ->
	dep = null

	beforeEach (done) ->
		require ['packages/speackers_list/collectionView'], (_dep) ->
			dep = _dep
			done()

	it 'should be test', (done) ->
		done()

	it 'should be funtion', () ->
		expect(dep.View).to.be.a 'function'

	it 'should create view', ->
		expect(new dep.View).to.be.a 'object'
