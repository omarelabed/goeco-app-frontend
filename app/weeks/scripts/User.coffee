angular.module('weeks')
    .factory 'User', ['$http', 'Week', ($http, Week) ->
        class User
            constructor: (@id, @username, weeks) ->
                @weeks = []
                angular.forEach(weeks, (week) => 
                    @weeks.push(new Week(week.weekId, week.name, week.validated, week.days))
                )
                @weeks = new Week(week.weekId, week.name, week.validated, week.days) for week in weeks
            save: ->
            getWeeks: ->
                @weeks
            print: ->
                [@id, @username, @weeks]
            getId: ->
                @id
]