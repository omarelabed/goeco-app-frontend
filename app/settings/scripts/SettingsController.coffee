angular
.module('settings')
.controller 'SettingsController', ['$scope', 'supersonic', '$http', 'UserSettings', 'Account', ($scope, supersonic, $http, UserSettings, Account) ->
    $scope.supersonic = supersonic
    console.log('SettingsController');
    supersonic.data.channel('settings_channel').subscribe (message) ->
        console.log message.content
        settings = new UserSettings(message.content)
        $scope.$apply ->
            $scope.settings = settings
            return
  ]      
