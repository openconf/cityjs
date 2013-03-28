define (require, exports, module)->
	exports.Partner = class Partner extends Backbone.Model
		url: '/getPartner'
		defaults:
			name: 'Lohika'
			url : 'www.lohika.com'
			logoSrc : '/assets/img/mock_img.png'

		validation:
			'name':
				required: true
				msg: 'Partner name is required'
			'url':
				required: true
				msg: 'Partner site url is required'
	return