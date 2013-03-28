expect = chai.expect

describe 'Test', ->
	Model = null

	beforeEach (done) ->
		require ['packages/SpeakerDetails/model'], (_dep) ->
			Model = _dep.SpeakerModel
			done()

	it 'should be test', (done) ->
		done()

	it 'should have correct data', ->
		m = new Model()
		expect(m.defaults).to.be.a 'object'
		expect(m.defaults).to.be.deep.equal { name: '', photo: '', description: '' }
