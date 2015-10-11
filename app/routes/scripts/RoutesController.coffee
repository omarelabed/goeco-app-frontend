angular
  .module('routes')
  .controller 'RoutesController',['$scope', 'supersonic',  ($scope, supersonic) ->
    $scope.supersonic = supersonic
    console.log('RoutesController');
    supersonic.data.channel('routes_channel').subscribe (message) ->
        console.log(message.content);
        $scope.$apply ->
            $scope.routes = message.content
            return
          ]
