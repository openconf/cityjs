define (require, exports, module) ->
	model = require './model'

	exports.Collection = class SpeakersCollection extends Backbone.Collection
		url: '/speakers/list'
		model: model.SpeakerModel

	return