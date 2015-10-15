angular.module('common')
.factory 'Account', ['$http', ($http) ->
    class Account
        constructor: (params) ->
            {@url, @user, @week_set, @id, @user_settings} = params            
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
            [@url, @user, @week_set, @id, @user_settings]
]