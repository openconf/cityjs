define (require, exports, module) ->
	class Meetup extends Backbone.Model
		url: '/meetup'
		defaults:
			name: 'Main meetup'
			city: 'Lviv'
			address: 'Lemkivska Str. 15, 3d floor'
			description: ''
			datetime: ''
			foto: ''

		validation:
			'name':
				required: true
				msg: 'Meetup name is required'
			'city':
				required: true
				msg: 'Meetup name is required'
			'address':
				required: true
				msg: 'Meetup name is required'