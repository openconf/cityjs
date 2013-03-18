define (require, exports, module) ->
	
	# Packages loading
	demoPackage = require 'packages/demo'
	friends = require 'packages/friends'
	shedule = require 'packages/shedule'
	
	#Utils and other
	Utils = require 'shared/utils'

	if module.config().fakeServer
		server = require 'server'
		server.start()

	exports.App = Backbone.Router.extend {
		routes:
			'*other': 'unknownRoute'

		initialize: ->
			Utils.bindRoutes @, [
				demoPackage.Controller
				friends.Controller
				demoPackage.Controller
				shedule.Controller
			]

		unknownRoute: ->
			console.log 'unknown route'
	}
	return
