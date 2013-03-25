define (require, exports, module)->
	model = require './model'
	signup_tpl = require 'text!./templates/signup.html'

	BaseView = require 'shared/base_view'
	
	exports.View = class MyView extends BaseView
		template: _.template signup_tpl

		events: 
			'click #signup-btn': 'signup'

		initialize: ->
			Backbone.Validation.bind(this) if @model?
			@model.bind 'signup:success', (data) =>
				user = JSON.parse(data.xhr)
				alert "Congratulations! User " + user.firstName + " " + user.lastName + " successfully registered"
			@model.bind 'signup:error', (data) =>
				errorMsg = JSON.parse(data.responseText)
				alert "Error " + errorMsg.error
			return

		render: ->
			@$el.html @template()
			return @

		signup: (e) ->
			e.preventDefault()
			formData = @$('form').serializeObject()
			isValid = @model.validate(formData)
			if !isValid 
				@model.signup(formData)

			return @

	return