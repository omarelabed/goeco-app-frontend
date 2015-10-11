angular
  .module('weeks')
  .controller 'WeeksController', ['$scope', 'supersonic', '$http', 'User', ($scope, supersonic, $http, User) ->
    $scope.supersonic = supersonic
    console.log('WeeksController');
    $http.get('https://dl.dropboxusercontent.com/u/16052944/user.json').then (result) ->
        console.log(result.data.weeks)
        $scope.weeks = result.data.weeks;
    
    $scope.showWeek = (week) ->
      console.log('Change to days view');
      console.log(week)
      message =
        content: week.days;
        sender: "..."
      supersonic.data.channel('days_channel').publish(message)
      view = new supersonic.ui.View
        location: "days#days"
        id: "days"
      supersonic.ui.layers.push view
  ]      
