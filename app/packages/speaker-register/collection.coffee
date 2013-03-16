define (require, exports, module)->
	exports.Collection = Backbone.Collection.extend(
		url: '/events'
	)
	return