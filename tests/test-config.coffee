# global define: true, _: true, require: true, requirejs: true, $: true

mocha.setup
	ignoreLeaks: on

require.config
	baseUrl: '/base/app'

	paths:
		# Substitute real google maps api URL with already loaded
		# local file to avoid loading it twice (since it's included in the testacular config):
		'google-maps-api': './assets/js/text'
