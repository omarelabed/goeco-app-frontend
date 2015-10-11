angular.module('weeks')
	.factory 'Day', ['$http', 'Route', ($http, Route) ->
		class Day
			constructor: (@id, @name, @validated, routes) ->
				@routes = []
				angular.forEach(routes, (route) => 
					@routes.push(new Route(route.id, route.reason, route.startTime, route.endTime, route.co2, route.energy, route.source, route.validated, route.activities))
				)
				@routes = new Route(route.id, route.reason, route.startTime, route.endTime, route.co2, route.energy, route.source, route.validated, route.activities) for route in routes
			save: ->
			getRoutes: ->
				@routes
			toString: ->
				[@id, @name, @validated, @days]
			getId: ->
				@id
]