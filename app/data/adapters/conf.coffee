define (require, exports, module) ->
	validate = (data) ->
		data.url.trim().slice(-5) is '.conf'

	createDataFetcher = (url) ->
		#could fail on browsers
		url: url.trim()

	exports.parse = (data, result, callback) ->
		return callback null, data, result if not validate(data)
		result = []
		lines = data.content.split('\n')
		result.push createDataFetcher line for line in lines when line and line.charAt(0) isnt '#'
		callback null, data, result
