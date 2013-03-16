define (require, exports, module)->
	exports.Model = Backbone.Model.extend(
		url: '/register/speaker'

		validation:
			'event':
				required: true
				msg: 'Event is required'
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
	)
	return