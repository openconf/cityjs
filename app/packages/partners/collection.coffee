define (require, exports, module)->
	model = require './model'
	exports.Partners = class Partners extends Backbone.Collection
		url: '/getPartners'
		model: model.Partner

		validation:
			'name':
				required: true
				msg: 'Partner name is required'
			'url':
				required: true
				msg: 'Partner site url is required'
	return