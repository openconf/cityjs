define (require, exports, module)->
	model = require './model'
	exports.Speackers = class Speackers extends Backbone.Collection
		url: '/getSpeackers'
		model: model.Speacker
	return