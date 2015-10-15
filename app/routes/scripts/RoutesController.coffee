angular
  .module('routes')
  .controller 'RoutesController',['$scope', 'supersonic', 'Day', ($scope, supersonic, Day) ->
    $scope.supersonic = supersonic
    console.log('RoutesController');
    supersonic.data.channel('routes_channel').subscribe (message) ->
        day = new Day(message.content);
        $scope.$apply ->
            $scope.routes = day.getRoutes()
            return
          ]
