angular
.module('menu')
.controller 'MenuController', ['$scope', 'supersonic', '$http', 'User', 'UserSettings', 'Account', '$translate', '$cookieStore', ($scope, supersonic, $http, User, UserSettings, Account, $translate, $cookieStore) ->
    $scope.supersonic = supersonic
    console.log('MenuController');

    #Gettting the params from the login and setting the cookie as logged in
    supersonic.data.channel('login_channel').subscribe (message) ->
        console.log message.content

    account = []
    user = []
    userSettings = []
    
    # accountJSON = 
    #     id: "io"
    #     url: "url.."
    #     user: "user.."
    #     week_set: "week set"
    #     user_settings: "user sett"

    

    # $http.get('http://10.0.3.2:8000/').success((data, status, headers, config) ->
    #     console.log 'success'
    #     return
    # ).error (data, status, headers, config) ->
    #     console.log data
    #     console.log status
    #     console.log headers
    #     console.log config
    #     return

    $http.get('https://dl.dropboxusercontent.com/u/16052944/user.json').then (result) ->
        console.log result.data
        account = new Account(result.data)
        user = new User(account.getUser())
        $scope.user = account.getUser()
        userSettings = new UserSettings(account.getUserSettings())
        console.log 'User:'
        console.log user
        console.log 'UserSettings:'
        console.log userSettings
        console.log account.getWeeks()

    

    $scope.showWeeks = () ->
        console.log('Change to weeks view');
        message =
            content: account
            sender: "..."
        supersonic.data.channel('weeks_channel').publish(message)
        view = new supersonic.ui.View
            location: "weeks#weeks"
            id: "weeks"
        supersonic.ui.layers.push view
    
    $scope.showSettings = () ->
        console.log('Change to settings view');
        message =
            content: userSettings
            sender: "..."
        supersonic.data.channel('settings_channel').publish(message)
        view = new supersonic.ui.View
            location: "settings#settings"
            id: "settings"
        supersonic.ui.layers.push view
    
    $scope.switchLanguage = (lang) ->
        $translate.use lang

    $scope.logOut = () ->
        $cookieStore.remove "login"
]
