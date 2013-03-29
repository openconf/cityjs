require.config {
	baseUrl: '/',

	urlArgs: 'v' + (Date.now()),

	config: {
		'data/dataSource' : {
			'adapters': [
				'data/adapters/json'
				'data/adapters/conf'
			]
		},
		'app': {
			'fakeServer': true
		}
	},

	shim: {
		'backbone': {
			deps: ['jquery', 'underscore']
			exports: 'Backbone'
		},
		'underscore': {
			exports: '_'
		},
		'backbone.paginator': ['backbone']
		'bootstrap': ['jquery']
		'backbone.validation': ['backbone']
		'backbone.routefilter': ['backbone']
		'gmaps': ['jquery', 'google-maps-api']
		'app': [
			'text'
			'async'
			'backbone.validation'
			'bootstrap'
		]
	},

	paths: {
		'text': 'assets/js/text'
		'async': 'assets/js/async'
		'backbone': 'assets/js/backbone-0.9.10'
		'underscore': 'assets/js/underscore-1.4.4'
		'backbone.paginator': 'assets/js/backbone.paginator'
		'jquery': 'assets/js/jquery-1.9.1'
		'google-maps-api': 'http://maps.googleapis.com/maps/api/js?v=3&sensor=true&callback=$.noop'
		'gmaps': 'assets/js/gmaps'
		'backbone.validation': 'assets/js/backbone.validation'
		'bootstrap': 'assets/js/bootstrap'
		'handlebars': 'assets/js/handlebars'
		'sinon': 'assets/js/sinon-1.5.2'
	},

	packages: [
		'packages/demo'
		'packages/organization'
		'packages/shedule'
		'packages/friends'
		'packages/events_map'
	]
}
