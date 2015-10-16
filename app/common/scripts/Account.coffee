angular.module('common')
.factory 'Account', ['$http', ($http) ->
    class Account
        constructor: (params) ->
            {@id, @url, @user, @week_set , @user_settings} = params            
        save: ->
        getUrl: ->
            @url
        getUser: ->
            @user
        getWeeks: ->
            @week_set
        getId: ->
            @id
        getUserSettings: ->
            @user_settings
        print: ->
            [@id, @url, @user, @week_set, @user_settings]
]