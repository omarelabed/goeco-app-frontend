angular.module('weeks')
	.factory 'Route', ['$http', ($http) ->
		class Route
			constructor: (@id, @reason, @startTime, @endTime, @co2, @energy, @source, @validated, @activities) ->

			print: ->
				[@id, @reason, @startTime, @endTime, @co2, @energy, @source, @validated, @activities]
			getId: ->
				@id
]