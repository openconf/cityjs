define (require, exports, module) ->
	validate = (body) ->
		try
			JSON.parse body
		catch e
			return false
		true

	exports.parse = (body, header) ->
		return false if not validate(body)
		JSON.parse(body)
