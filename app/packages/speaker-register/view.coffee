define (require, exports, module) ->
	tpl = require 'text!./templates/form.html'

	exports.View = Backbone.View.extend(
		template: _.template tpl

		events:
			'change .e-eventSelector': 'onSelectEvent'
			'submit .e-speakerForm': 'onSpeakerRegister'
			'click .e-speakerFormSubmit': 'onSpeakerRegister'

		initialize: (model, collection) ->
			@model || (@model = model)
			@collection || (@collection = collection)
			Backbone.Validation.bind(this) if @model?
			return

		render: ->
			@$el.html @template(
				data:
					events: @collection.toJSON()
			)
			return @

		onRegister: (model) ->
			@$el.html('okay.jpg')
			return @

		onSelectEvent: (ev) ->
			# bro, i know... sry for that
			evntId = jQuery(ev.currentTarget).val()
			if evntId
				data = @collection.get(evntId).toJSON()
				list = "<ul><% _.each(data, function(value, key) { %> <li><%= key %>: <%= value %></li> <% }); %></ul>";
				@$el.find('.e-eventInfo').html(_.template(list, {data: data})).closest('div.control-group').show()
			else
				@$el.find('.e-eventInfo').html('').closest('div.control-group').hide()

			return @

		onSpeakerRegister: (ev) ->
			ev.preventDefault();
			# would be better set model data onChange, but... ok
			form = jQuery('.e-speakerForm').serializeArray()
			data = {}
			_.each(form, (item) -> data[item.name] = item.value)
			# @TODO: subscribe on model save and show messages...
			# @TODO: validate before save

			# sorry bro, can't think in coffee...
			self = this
			@model.save(data, {
				success: (model, response, options) ->
					self.onRegister(model)
			})
			return @
	)
	return
