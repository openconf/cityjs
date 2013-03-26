define (require, exports, module) ->
	observer = {}
	adapters = []
	proxy = require 'data/cors/proxy'
	async = require 'async'


	#TODO: read all configured adapters
	# adapters are converting data based on a file type and content to JSON
	# for example json files could be just parsed to json and html types could parse out microformats content
	_.extend observer, Backbone.Events
	
	require module.config().adapters, () ->
		adapters = []
		_(arguments).each (elem, key)->
			adapters[key] = _(elem).value()

	getOne = (url, initial, callback) ->
		if _(initial).isFunction()
			callback = initial
			initial = {}	
		proxy.getUrl url, (err, data)->
			chain = [(callback)->
				callback(null, data, initial)
			].concat adapters
			async.waterfall(chain, (err, data, result)->
				callback(err, data, result)
			)

	mapper = (item, callback) ->
		get item.url, item, callback

	get = (url, initial = {}, callback) ->
		if _(initial).isFunction()
			callback = initial
			initial = {}
		getOne url, (err, data, result) ->
			if _(result).isArray()
				return async.map result, mapper, (err, results)->
					callback err, results
			else
				callback err, result


	
	exports.source = ()->
		on: (type, callback) ->
			if type instanceof Function
				type = 'data'
				callback = type
			observer.bind type, callback
		# .get(url) - get's reads configuration from given url
		# if url starts with http - reads web adress, otherwise consider it local
		get:  get
			#TODO: take all adapters to try to handle/convert data source to JSON chunk
			#TODO: trigger the observer and broadcast the chunk
