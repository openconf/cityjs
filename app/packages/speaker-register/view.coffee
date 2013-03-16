define (require, exports, module) ->
	tpl = require 'text!./templates/form.html'
	infoTmpl = require 'text!./templates/event.html'

	exports.View = class View extends Backbone.View
		template: _.template tpl
		templateInfo: _.template infoTmpl

		events:
			'change .e-eventSelector': 'onSelectEvent'
			'submit .e-speakerForm': 'onSpeakerRegister'
			'click .e-speakerFormSubmit': 'onSpeakerRegister'

		initialize: (model, collection) ->
			Backbone.Validation.bind(this) if @model?
			return

		render: ->
			@$el.html @template
				data:
					events: @collection.toJSON()

			return @

		onRegister: (model) ->
			@$el.html('okay.jpg')
			return @

		onSelectEvent: (ev) ->
			# bro, i know... sry for that
			evntId = jQuery(ev.currentTarget).val()
			$evntInfo = @$el.find('.e-eventInfo')
			if evntId
				data = @collection.get(evntId).toJSON()
				# list = "<ul><% _.each(data, function(value, key) { %> <li><%= key %>: <%= value %></li> <% }); %></ul>";
				$evntInfo.html @templateInfo
					data: data
				$evntInfo.closest('.control-group').show()
			else
				$evntInfo.html('').closest('.control-group').hide()

			return @

		onSpeakerRegister: (ev) ->
			ev.preventDefault()
			form = @$el.find('.e-speakerForm').serializeArray()
			data = {}
			_.each(form, (item) -> data[item.name] = item.value)

			if @model.validate(data)
				# @TODO: write common helpers to show nice popup msgs
				@$el.find('.e-speakerForm .alert').show()
				return @

			@model.save(data, {
				success: (model, response, options) =>
					@onRegister model
			})
			return @

	return
