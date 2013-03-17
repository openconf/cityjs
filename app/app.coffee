define (require, exports, module) ->
	
	# Packages loading	
	demoPackage = require 'packages/demo'
	orgteamPackage = require 'packages/org-team'

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
        orgteamPackage.Controller
			]

		unknownRoute: ->
			console.log 'unknown'
	}
	return
