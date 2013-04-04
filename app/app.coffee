define (require, exports, module) ->


	Utils = require 'shared/utils'
	packageJson = JSON.parse (require 'text!package.json')
	names = ('packages/'+ name + '/main' for name in packageJson.cityjsPackages)



	exports.App = Backbone.Router.extend {
		routes:
			'*other': 'unknownRoute'

		initialize: ->

			require names, () =>
				packages = Array.prototype.splice.call arguments, 0
				controllers = (pkg.Controller for pkg in packages)

				if module.config().fakeServer
					server = require 'server'
					server.start()

				Utils.bindRoutes @, controllers

		unknownRoute: ->
			console.log 'unknown route'
	}
	return

