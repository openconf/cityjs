define (require, exports, module) ->
	
	# Packages loading
	demoPackage = require 'packages/demo'
	friends = require 'packages/friends'
	shedule = require 'packages/shedule'
	partners = require 'packages/partners'
	#data = require 'data/dataSource'
	#data().get '/published.conf', ()->
		#console.log arguments

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
				shedule.Controller
				partners.Controller
			]

		unknownRoute: ->
			console.log 'unknown route'
	}
	return
