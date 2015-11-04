angular
.module('registration')
.controller 'RegistrationController', ['$scope', 'supersonic', '$http', 'User', 'UserSettings', 'Account', '$translate', '$cookieStore', ($scope, supersonic, $http, User, UserSettings, Account, $translate, $cookieStore) ->
    $scope.supersonic = supersonic
    console.log('RegistrationController');

    user=
        password:""
        username:""
        first_name:""
        last_name:""
        email_name:""
    
    message=
        name:""
    
    isDisabled = 
        type: true

    $scope.isDisabled=isDisabled
    $scope.message=message
    $scope.user=user
    
    # TODO: add control to password strength
    $scope.$watch 'confirmPassword', ->
        console.log $scope.user.password
        console.log $scope.confirmPassword
        if $scope.confirmPassword == $scope.user.password
            $scope.isDisabled.type=false
            $scope.message.name="Password match"
        else
            $scope.isDisabled.type=true
            $scope.message.name="Password doesn't match"
   
    $scope.submit = () ->
        # params = {
        #     appUserId:null
        #     user:
        #         username: $scope.user.username
        #         password: $scope.user.password
        #         email: "pinco@gmail.com"
        #         first_name: "pinco"
        #         last_name: "pallino"
        #     user_settings:
        #         notifications: false
        #         car_owner: false
        #     week_set:[]
        # }
        # console.log params
        link = "http://lcvapi-goeco.rhcloud.com/goecoaccount/"
        credentials=btoa("lcvadmin:BuyqxqUC")
        console.log credentials
        id=""
        $http(
            method: 'POST'
            headers: 
                'Authorization': 'Basic '+ credentials
            url: link
            data:
                appUserId:null
                user:
                    username: $scope.user.username
                    password: $scope.user.password
                    email: "aron@gmail.com"
                    first_name: "aorn"
                    last_name: "aorn"
                user_settings:
                    notifications: false
                    car_owner: false
                week_set:[]
                ).then ((response) ->
                console.log response
                id=response.data.id
                console.log id
                link = "https://api.moves-app.com/oauth/v1/authorize?response_type=code&client_id=2xqZaqu0f38zWPBumipSD36Vp4B0k40U&scope=activity location&state="+id
                supersonic.app.openURL(link).then ((response) ->
                    console.log response
                    return
                ), (response) ->
                    #error
                    console.log response
                    return
                return
            ), (response) ->
                    #error
                console.log response
                return
        # link = "https://api.moves-app.com/oauth/v1/authorize?response_type=code&client_id=2xqZaqu0f38zWPBumipSD36Vp4B0k40U&scope=activity location&state="+id
        # $http(
        #     method: 'POST'
        #     url: link
        #     params:
        #         appUserId:null
        #         user:
        #             username: $scope.user.username
        #             password: $scope.user.password
        #             email: "pinco@gmail.com"
        #             first_name: "pinco"
        #             last_name: "pallino"
        #         user_settings:
        #             notifications: false
        #             car_owner: false
        #         week_set:[]
        #         ).then ((response) ->
        #         console.log response
        #         return
        #     ), (response) ->
        #         console.log response
        #         return
        
        
        # $http(
        #     method: 'GET'
        #     url: link).then ((response) ->
        #         console.log response
        #         return
        #     ), (response) ->
        #         console.log response
        #         return
        
        # supersonic.app.openURL(link).then ((response) ->
        #     console.log "success"
        #     return
        # ), (response) ->
        #     console.log "error"
        #     return
       
        #TODO: call the main view?
        # message =
        #     content:
        #         token: 'thisisthetoken'
        #         sender: "..."
        # supersonic.data.channel('login_channel').publish(message)
        # view = new supersonic.ui.View
        #     location: "menu#menu"
        #     id: "menu"
        # supersonic.ui.layers.push view
]
