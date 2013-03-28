define (require, exports, module)->
	View = require './view'
	Model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes: 
			'meetup': 'meetup_details'

		meetup_details: -> 
			console.log 'meetup'
			meetup_model = new Model 
				foto: '/assets/img/lviv_city.jpg'
				datetime: '30 березня 2013'
				description: 'It will be very interesting !!'
			meetup_view = new View model: meetup_model
			
			$('.main-heading').text meetup_model.get('name')
			$('#demo-box').html meetup_view.render().$el
	return