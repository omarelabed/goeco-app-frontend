angular
  .module('days')
  .controller 'DaysController', ['$scope', 'supersonic' , 'Week', ($scope, supersonic, Week) ->
    $scope.supersonic = supersonic
    console.log('DaysController');
    supersonic.data.channel('days_channel').subscribe (message) ->
        week = new Week(message.content)
        $scope.$apply ->
            $scope.days = week.getDays()
            return

    $scope.showDay = (day) ->
      console.log('Change to routes view');
      console.log(day)
      message =
        content: day
        sender: "..."
      supersonic.data.channel('routes_channel').publish(message)
      view = new supersonic.ui.View
        location: "routes#routes"
        id: "routes"
      supersonic.ui.layers.push view
    ]
