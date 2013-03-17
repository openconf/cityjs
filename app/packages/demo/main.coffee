define (require, exports, module)->
	view = require './view'
	model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'demo': 'demo'

		demo: ->
			console.log 'demo'
			return @
	return
