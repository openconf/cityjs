define (require, exports, module) ->
	validate = (data) ->
		_(data).isObject()

	exports.parse = (data, result, callback) ->
		return callback null, data, result if not validate(data.content)
		resultData = 
			url: data.url
		
		callback null, data, _.extend(result, data.content, resultData)
