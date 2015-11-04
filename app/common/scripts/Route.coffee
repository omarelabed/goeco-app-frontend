angular.module('common')
.factory 'Route', ['HTTPService', (HTTPService) ->
    class Route
        constructor: (params) ->
            {@appUserId, @routeId, @reason, @startTime, @endTime, @co2, @energy, @validated, @activities} = params
            @httpService = new HTTPService()
        print: ->
            [@routeId, @reason, @startTime, @endTime, @co2, @energy, @source, @validated, @activities]
        
        getActivities: ->
            @activities

        validate: ->
            @httpService.get("http://jsonplaceholder.typicode.com/posts/1")
]