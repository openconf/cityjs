define (require, exports, module) ->
	SpeakerView = (require './speaker_view').SpeakerView

	exports.SpeakersView = Backbone.View.extend(
		render: ->
			@collection.fetch success: =>
				for model in @collection.models
					speaker = @collection.get model
					_view = new SpeakerView model:speaker
					@$el.append _view.render().$el
				@
			@
	)

	return