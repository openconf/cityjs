expect = chai.expect

describe 'SpeakerView test', ->
	View = null

	beforeEach (done) ->
		require ['packages/SpeakerDetails/speaker_view'], (_dep) ->
			View = _dep.SpeakerView
			done()

	it 'should be test', ->
		expect(View).to.be.a 'function'
		v = new View()
		expect(v instanceof Backbone.View).to.be.ok
