angular
.module('weeks')
.controller 'WeeksController', ['$scope', 'supersonic', '$http', 'User', 'UserSettings', 'Account', ($scope, supersonic, $http, User, UserSettings, Account) ->
    $scope.supersonic = supersonic
    console.log('WeeksController');
    supersonic.data.channel('weeks_channel').subscribe (message) ->
        account = new Account(message.content)
        $scope.$apply ->
            $scope.weeks = account.getWeeks()
            return

    $scope.showWeek = (week) ->
        console.log('Change to days view');
        console.log(week)
        message =
            content: week
            sender: "..."
        supersonic.data.channel('days_channel').publish(message)
        view = new supersonic.ui.View
            location: "days#days"
            id: "days"
        supersonic.ui.layers.push view
]      
