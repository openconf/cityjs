expect = chai.expect

describe 'Test', ->
	dep = null

	beforeEach (done) ->
		require [], (_dep) ->
			dep = _dep
			done()

	it 'should be test', (done) ->
		done()

	it 'should be not ok', ->
		expect(false).to.not.be.ok