define (require, exports, module)->
	view = require './view'
	model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes: 
			'signin': 'signin'
			'signup': 'signup'


		signin: ->
			console.log 'signin'
			@currentView = new view.View(
				model: new model.Model()
			)
			$('#auth-box').html @currentView.render("login").$el
			return @


		signup: ->
			console.log 'signup'
			@currentView = new view.View(
				model: new model.Model()
			)
			$('#auth-box').html @currentView.render("register").$el
			return @

	return