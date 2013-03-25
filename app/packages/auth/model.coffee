define (require, exports, module)->
	exports.Model = Backbone.Model.extend(
		
		defaults:
			username: ''

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

		signin: (data) ->
			self = this
			$.ajax 
				url: '/auth/signin'
				type: 'POST'
				data: JSON.stringify(data) 
				success: (data) ->
					self.trigger "signin:success", data
				error: (data) ->
					self.trigger "signin:error", data

		signup: (data) ->
			self = this
			$.ajax 
				url: '/auth/signup'
				type: 'POST'
				data: JSON.stringify(data)
				success: (data) ->
					self.trigger "signup:success", data
				error: (data) ->
					self.trigger "signup:error", data
	)
	return