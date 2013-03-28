define (require, exports, module) ->
	
	# Packages loading
	demoPackage = require 'packages/demo'
	friends = require 'packages/friends'
	shedule = require 'packages/shedule'
	meetup_details= require 'packages/meetup_details'
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
				meetup_details.Controller
			]

		unknownRoute: ->
			console.log 'unknown route'
	}
	return
