angular.module('common')
.factory 'TrackPoint', ['$http', ($http) ->
    class TrackPoint
        constructor: (params) ->
            {@lat, @lng} = params
        print: ->
            [id, @lat, @lng, @time]
        getId: ->
            @id
]