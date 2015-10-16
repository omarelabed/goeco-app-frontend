angular.module('common')
.factory 'Route', ['$http', ($http) ->
    class Route
        constructor: (params) ->
            {@routeId, @reason, @startTime, @endTime, @co2, @energy, @source, @validated, @activities} = params
        
        print: ->
            [@routeId, @reason, @startTime, @endTime, @co2, @energy, @source, @validated, @activities]
        
        getActivities: ->
        	@activities

        getRouteId: ->
            @routeId
]