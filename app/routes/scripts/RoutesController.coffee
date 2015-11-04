angular
.module('routes')
.controller 'RoutesController',['$http', '$scope', 'supersonic', 'Route', ($http, $scope, supersonic, Route) ->
    $scope.supersonic = supersonic
    console.log('RoutesController');
    supersonic.data.channel('routes_channel').subscribe (message) ->
        $scope.$apply ->
            $scope.route = new Route(message.content)
            return

# TODO: send also the activity in order to set directly to the chosen activity
    $scope.showMap = (route) ->
        console.log route
        message =
            content: route
            sender: "..."
        supersonic.data.channel('map_channel').publish(message)
        view = new supersonic.ui.View
            location: "activity#activity"
            id: "activity"
        supersonic.ui.layers.push view

    # TODO: implement validation, prevent null field in reason 
    $scope.validate = () ->
        $scope.route.validate().then (response) ->
            console.log response
        # view = new supersonic.ui.View
        #     location: "sensors#geolocation"
        #     id: "geolocation"
        # supersonic.ui.layers.push view
]
