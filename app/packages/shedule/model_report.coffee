define (require, exports, module)->
	exports.Report = class ReportModel extends Backbone.Model
		url: '/shedule/report/'
		defaults:
			reporter_name: "Имя Докладчика"
			avatar_uri: "http://avatars.com/avatar.jpg"
			title: "Название доклада"
			uri_title: "inline-title-for-uri"
			text: "Это какой-то html описывающий доклад, там всякие ютюбики и слайды"

	return