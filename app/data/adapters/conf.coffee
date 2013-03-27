define (require, exports, module) ->
	validate = (data) ->
		data.url.trim().slice(-5) is '.conf'
	
	propMatcher = /^#+\s*([\w.]+)=(.*)$/

	exports.parse = (data, result, callback) ->
		return callback null, data, result if not validate(data)
		
		parser = (lines, result = [], meta = {})->
			if lines.length is 0 
				return result
			line = lines.shift()
			if line.charAt(0) is '#' and line.indexOf('=') isnt -1
				prop = propMatcher.exec line
				props = {}
				props[prop[1]]=prop[2]
				meta = _.extend meta,props
				return parser lines, result, meta
			else if line.charAt(0) isnt '#' and line.length isnt 0
				data = {
					url: line.trim()
				}
				data = _.extend(data, meta)
				result.push data
				meta = {}
			return parser lines, result, meta
		result = parser data.content.split('\n')
		callback null, data, result
