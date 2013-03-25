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
			$.ajax 
				url: '/auth/signin'
				type: 'POST'
				data: JSON.stringify(data) 
				success: (data) ->
					user = JSON.parse(data.xhr)
					alert "You logged in as " + user.email
				error: (data) ->
					errorMsg = JSON.parse(data.responseText)
					alert "Error " + errorMsg.error

		signup: (data) ->
			$.ajax 
				url: '/auth/signup'
				type: 'POST'
				data: JSON.stringify(data) 
				success: (data) ->
					user = JSON.parse(data.xhr)
					alert "Congratulations! User " + user.firstName + " " + user.lastName + " successfully registered"
				error: (data) ->
					errorMsg = JSON.parse(data.responseText)
					alert "Error " + errorMsg.error

	)
	return