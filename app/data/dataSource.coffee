define (require, exports, module) ->
	observer = {}
	adapters = []
	#TODO: read all configured adapters
	# adapters are converting data based on a file type and content to JSON
	# for example json files could be just parsed to json and html types could parse out microformats content
	_.extend observer, Backbone.Events
	
	require module.config().adapters, () ->
		adapters = arguments

	exports.on = (type, callback) ->
		if type instanceof Function
			type = 'data'
			callback = type
		observer.bind type, callback
	# .get(url) - get's reads configuration from given url
	# if url starts with http - reads web adress, otherwise consider it local
	exports.get =  (url, callback) ->
		#TODO: jquery get data url
		#TODO: take all adapters to try to handle/convert data source to JSON chunk
		#TODO: trigger the observer and broadcast the chunk
