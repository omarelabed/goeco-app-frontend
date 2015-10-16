angular.module('common')
.factory 'Activity', ['$http', ($http) ->
    class Activity
        constructor: (params) ->
            {@id, @activityMoves, @activityIDSIA, @activity, @validated, @startTime, @endTime, @duration, @trackPoints} = params            

        save: ->
        
        getTrackPoints: ->
            @trackPoints

        getId: ->
            @id

        print: ->
            [@id, @activityMoves, @activityIDSIA, @activity, @validated, @startTime, @endTime, @duration, @trackPoints]
]