define (require, exports, module)->
	exports.Model = Backbone.Model.extend(
		url: '/test'
		defaults:
			username: 'Petro'

		validation:
			'firstName':
				required: true
				msg: 'Firstname is required'
			'lastName':
				required: true
				msg: 'Lastname is required'
			'password':
				required: true
				msg: 'Password is required'
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