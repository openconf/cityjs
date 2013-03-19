define (require, exports, module)->
	exports.Model = Backbone.Model.extend(
		#url: '/test'
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
					alert "Вы вошли как " + user.email

		signup: (data) ->
			$.ajax 
				url: '/auth/signup'
				type: 'POST'
				data: JSON.stringify(data) 
				success: (data) ->
					user = JSON.parse(data.xhr)
					alert "Поздравляем! Пользователь " + user.firstName + " " + user.lastName + " успешно зарегистрирован"

	)
	return