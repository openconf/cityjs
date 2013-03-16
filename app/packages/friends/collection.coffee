define (require, exports, module)->
	model = require './model'
	exports.Friends = class Friends extends Backbone.Collection
		url: '/getFriends'
		model: model.Friend

		validation:
			'name':
				required: true
				msg: 'Company name is required'
			'url':
				required: true
				msg: 'Company site url is required'
	return