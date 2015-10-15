angular.module('common')
.factory 'Week', ['$http', ($http) ->
    class Week
        constructor: (params) ->
            {@weekId, @name, @validated, @days} = params
            # @days = []
            # angular.forEach(days, (day) =>
            #     @days.push(new Day(day))
            # )
        save: ->
        getDays: ->
            @days
        print: ->
            [@weekId, @name, @validated, @days]
        getWeekId: ->
            @weekId
]

# angular.module('weeks')
# 	.factory 'Week', ['$http', 'Day', ($http, Day) ->
# 		class Week
# 			constructor: (@id, @name, @validated, days) ->
# 				@days = []
# 				angular.forEach(days, (day) => 
# 					@days.push(new Day(day.dayId, day.name, day.validated, day.routes))
# 				)
# 				@days = new Day(day.dayId, day.name, day.validated, day.routes) for day in days
# 			save: ->
# 			getDays: ->
# 				@days
# 			print: ->
# 				[@id, @name, @validated, @days]
# 			getId: ->
# 				@id
# ]