define (require, exports, module)->
	signin_tpl = require 'text!./templates/signin.html'
	signup_tpl = require 'text!./templates/signup.html'

	BaseView = require 'shared/base_view'
	
	exports.View = class MyView extends BaseView
		template_signin: _.template signin_tpl
		template_signup: _.template signup_tpl

		events: 
			'click #signup-btn': 'signup'
			'click #signin-btn': 'signin'

		initialize: ->
			Backbone.Validation.bind(this) if @model?
			return

		render: (type) ->
			if type is "login"
				@$el.html @template_signin()
			else 
				@$el.html @template_signup()
			return @

		signup: (e) ->
			e.preventDefault()
			formData = @$('form').serializeObject()
			isValid = @model.validate(formData)
			if !isValid 
				console.log(isValid)
				$.ajax 
					url: '/auth/signup'
					type: 'POST'
					data: JSON.stringify(formData) 
					success: (data) ->
						user = JSON.parse(data.xhr)
						alert "Поздравляем! Пользователь " + user.firstName + " " + user.lastName + " успешно зарегистрирован"

				console.log "You try signup"
			else 
				#console.log(isValid)
				$.each isValid, (field, msg) ->
					console.log(field, msg)
			return @

		signin: (e) ->
			e.preventDefault()
			console.log "You try signin"
			return @

	return