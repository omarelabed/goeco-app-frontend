angular
.module('login')
.controller 'LoginController', ['$scope', 'supersonic', '$http', 'User', 'UserSettings', 'Account', '$translate', ($scope, supersonic, $http, User, UserSettings, Account, $translate) ->
    $scope.supersonic = supersonic
    console.log('LoginController');
    

    $scope.submit = (username, password) ->
        console.log(username);
        console.log(password);
        message =
            content:
                username: this.username
                password: this.password
            sender: "..."
        supersonic.data.channel('login_channel').publish(message)
        view = new supersonic.ui.View
            location: "menu#menu"
            id: "menu"
        supersonic.ui.layers.push view
]
