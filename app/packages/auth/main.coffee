define (require, exports, module)->
	view_signin = require './view_signin'
	view_signup = require './view_signup'
	model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes: 
			'signin': 'signin'
			'signup': 'signup'


		signin: ->
			#console.log 'signin'
			@currentView = new view_signin.View(
				model: new model.Model()
			)
			$('#auth-box').html @currentView.render().$el
			return @


		signup: ->
			#console.log 'signup'
			@currentView = new view_signup.View(
				model: new model.Model()
			)
			$('#auth-box').html @currentView.render().$el
			return @

	return