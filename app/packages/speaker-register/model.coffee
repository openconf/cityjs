define (require, exports, module)->
	exports.Model = class Model extends Backbone.Model
		url: '/register/speaker'
		validation:
			'event':
				required: true
				msg: 'Event is required'
			'title':
				required: true
				msg: 'Title is required'
			'username':
				required: true
				msg: 'Username is required'
			'email': [
				{
					required: true
					msg: 'Email is required'
				}
				{
					pattern: 'email'
					msg: 'Invalid email'
				}
			]
	return