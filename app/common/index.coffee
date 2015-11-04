angular.module 'common', [
  # Declare here all AngularJS dependencies that are shared by all modules.
  'supersonic',
  'pascalprecht.translate',
  'uiGmapgoogle-maps',
  'ngCookies',
  'angularMoment'
]

angular
  .module 'common'
  .run (supersonic) ->

    supersonic.ui.screen.setAllowedRotations ["portrait", "portraitUpsideDown"]