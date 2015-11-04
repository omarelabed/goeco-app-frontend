angular
  .module('days')
  .controller 'DaysController', ['$http', '$scope', 'supersonic' , 'Week', 'Route', ($http, $scope, supersonic, Week, Route) ->
    $scope.supersonic = supersonic
    console.log('DaysController');
    # supersonic.data.channel('days_channel').subscribe (message) ->
    #     week = new Week(message.content)
    #     $scope.$apply ->
    #         $scope.days = week.getDays()
    #         return

    $http.get('https://dl.dropboxusercontent.com/u/16052944/test_validated_true.json').then (result) ->
      console.log result.data
      route1 = new Route(result.data)
      $scope.route1 = route1

    $http.get('https://dl.dropboxusercontent.com/u/16052944/test_validated_false.json').then (result) ->
      console.log result.data
      route2 = new Route(result.data)
      $scope.route2 = route2

    $scope.showDay = (route) ->
      console.log('Change to route view');
      console.log(route)
      message =
        content: route
        sender: "..."
      supersonic.data.channel('routes_channel').publish(message)
      view = new supersonic.ui.View
        location: "routes#routes"
        id: "routes"
      supersonic.ui.layers.push view
    ]
