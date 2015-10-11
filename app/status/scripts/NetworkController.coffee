angular
  .module('status')
  .controller 'NetworkController', ($scope, supersonic) ->

    $scope.networkStatus = "online"

    supersonic.device.network.whenOffline ->
      $scope.networkStatus = "offline"

    supersonic.device.network.whenOnline ->
    	$scope.networkStatus = "online"
    	message1 =
      		sender: "beers#create2"
      		contet: "a new beer brewed2"
    	supersonic.data.channel('public_announcements2').publish(message1)
    	supersonic.data.channel('public_announcements').subscribe (message) ->
    		console.log message
    		return
  	return

