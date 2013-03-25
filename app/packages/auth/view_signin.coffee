define (require, exports, module)->
	model = require './model'
	signin_tpl = require 'text!./templates/signin.html'

	BaseView = require 'shared/base_view'
	
	exports.View = class MyView extends BaseView
		template: _.template signin_tpl

		events: 
			'click #signin-btn': 'signin'
		
		initialize: ->
			Backbone.Validation.bind(this) if @model?
			@model.bind 'signin:success', (data) =>
				user = JSON.parse(data.xhr)
				alert "You logged in as " + user.email
			@model.bind 'signin:error', (data) =>
				errorMsg = JSON.parse(data.responseText)
				alert "Error " + errorMsg.error
			return

		render: ->
			@$el.html @template()
			return @

		signin: (e) ->
			e.preventDefault()
			formData = @$('form').serializeObject()
			isValid = @model.validate(formData)
			if !isValid 
				@model.signin(formData) 

			return @

	return