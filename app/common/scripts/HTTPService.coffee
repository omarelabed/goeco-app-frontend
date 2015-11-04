angular.module('common')
.factory 'HTTPService', ['$http', ($http) ->
    class HTTPService

        constructor: () ->

        save: (_url, _params) ->
            $http(
                method: 'POST'
                url: _url
                data: _params
                ).then ((response) ->
                    console.log("POST success: " + response)
                    response.data
            ), (response) ->
                    console.log("POST error: " + response)
                    response.data

        get: (_url, _params) ->
            $http(
                method: 'GET'
                url: _url
                ).then ((response) ->
                    console.log("GET success: " + response)
                    response.data
            ), (response) ->
                    console.log("GET error: " + response)
                    response.data

        update: (_url, _params) ->
            $http(
                method: 'PUT'
                url: _url
                ).then ((response) ->
                    console.log("PUT success: " + response)
                    response.data
            ), (response) ->
                    console.log("PUT error: " + response)
                    response.data

        delete: (_url, _params) ->
            $http(
                method: 'DELETE'
                url: _url
                ).then ((response) ->
                    console.log("DELETE success: " + response)
                    response.data
            ), (response) ->
                    console.log("DELETE error: " + response)
                    response.data                   

        test: ->
        	"Is working"
]