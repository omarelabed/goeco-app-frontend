angular.module('common').config [ '$translateProvider', ($translateProvider) ->
    $translateProvider.translations('en',
        USERNAME: 'Username'
        SWITCH_LANGUAGE_EN: 'Switch to English'
        SWITCH_LANGUAGE_IT: 'Switch to Italian'
        NAVIGATE_BACK: 'Navigate back'
        ).translations('it',
        USERNAME: 'Nome utente'
        SWITCH_LANGUAGE_EN: 'Passa all\'Inglese'
        SWITCH_LANGUAGE_IT: 'Passa all\'Italiano'
        NAVIGATE_BACK: 'Torna indietro'
        )
    $translateProvider.preferredLanguage 'en'
    return
]