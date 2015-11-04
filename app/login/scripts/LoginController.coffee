angular
.module('login')
.controller 'LoginController', ['$scope', 'supersonic', '$http', 'User', 'UserSettings', 'Account', '$translate', '$cookieStore', ($scope, supersonic, $http, User, UserSettings, Account, $translate, $cookieStore) ->
    $scope.supersonic = supersonic
    console.log('LoginController');

    user=
        password:""
        username:""
    
    log=
        message:""
    
    loginState = 
        state: true

    $scope.loginState=loginState
    $scope.log=log
    $scope.user=user
  
    $scope.submit = () ->
        console.log $scope.user
        #TODO: send user params to LCV server and retrieve the token
        #TODO: manage errors in case the user doesnt exists
        if false 
            $scope.log.message = "Authentication error"
            $scope.user=
                password:""
                username:""
        else
            $cookieStore.put('auth','thisisthetoken')
            message =
                content:
                    # username: $scope.user.username
                    # password: $scope.user.password
                    token: 'thisisthetoken'
                sender: "..."
            supersonic.data.channel('login_channel').publish(message)
            view = new supersonic.ui.View
                location: "menu#menu"
                id: "menu"
            supersonic.ui.layers.push view

    $scope.register = () ->
        console.log "calling registration view"
        view = new supersonic.ui.View
            location: "registration#registration"
            id: "registration"
        supersonic.ui.layers.push view

    $scope.login = () ->
        if $cookieStore.get "auth"
            console.log $cookieStore.get "auth"
            message =
                content:
                    token: 'thisisthetoken'
                sender: "..."
            supersonic.data.channel('login_channel').publish(message)
            view = new supersonic.ui.View
                location: "menu#menu"
                id: "menu"
            supersonic.ui.layers.push view
        else
            console.log "Login required"
            $scope.loginState.state=false
            return
        return
]
