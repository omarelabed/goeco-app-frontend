angular
  .module('days')
  .controller 'DaysController', ['$scope', 'supersonic' ,($scope, supersonic) ->
    $scope.supersonic = supersonic
    console.log('DaysController');
    supersonic.data.channel('days_channel').subscribe (message) ->
        console.log(message.content);
        $scope.$apply ->
            $scope.days = message.content
            return

    $scope.showDay = (day) ->
      console.log('Change to routes view');
      message =
        content: day.routes
        sender: "..."
      supersonic.data.channel('routes_channel').publish(message)
      view = new supersonic.ui.View
        location: "routes#routes"
        id: "routes"
      supersonic.ui.layers.push view
    ]
