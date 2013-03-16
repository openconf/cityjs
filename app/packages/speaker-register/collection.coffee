define (require, exports, module)->
	exports.Collection = class Collection extends Backbone.Collection
		url: '/events'

	return