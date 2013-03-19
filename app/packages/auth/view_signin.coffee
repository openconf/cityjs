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