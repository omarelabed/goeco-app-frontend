angular.module('common')
.factory 'UserSettings', ['$http', ($http) ->
    class UserSettings
        constructor: (params) ->
            {@url, @notifications, @car_owner} = params            
        save: ->
        getUrl: ->
            @url
        getNotifications: ->
            @notifications
        getCarOwner: ->
            @car_owner
        print: ->
            [@url, @notifications, @car_owner]
]