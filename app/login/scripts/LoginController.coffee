angular
.module('login')
.controller 'LoginController', ['$scope', 'supersonic', '$http', 'User', 'UserSettings', 'Account', '$translate', '$cookieStore', ($scope, supersonic, $http, User, UserSettings, Account, $translate, $cookieStore) ->
    $scope.supersonic = supersonic
    console.log('LoginController');
    
    # Check if it is already logged in by controlling the cookie, if it is skip to the menu view
    if $cookieStore.get "login"
            console.log $cookieStore.get "login" 
        else
            view = new supersonic.ui.View
            location: "menu#menu"
            id: "menu"

    #Send the user params to the main view    
    $scope.submit = (username, password) ->
        console.log(username);
        console.log(password);
        message =
            content:
                username: this.username
                password: this.password
            sender: "..."
        #Channel used to share data between the login and the menu view
        supersonic.data.channel('login_channel').publish(message)
        view = new supersonic.ui.View
            location: "menu#menu"
            id: "menu"
        supersonic.ui.layers.push view
]
