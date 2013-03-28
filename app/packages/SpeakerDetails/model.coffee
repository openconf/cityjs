define (require, exports, module) ->
	exports.SpeakerModel = Backbone.Model.extend(
		defaults:
			name: ''
			photo: ''
			description: ''
	)
	return