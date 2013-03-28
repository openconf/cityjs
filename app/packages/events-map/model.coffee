define (require, exports, module) ->
    class EventModel extends Backbone.Model
        urlRoot: 'events'