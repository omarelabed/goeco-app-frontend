angular
  .module('kitchensink')
  .controller 'SettingsController', ($scope, supersonic) ->
    $scope.navbarTitle = "Settings"
    $scope.supersonic = supersonic
