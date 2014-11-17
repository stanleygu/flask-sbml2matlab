'use strict'

angular.module 'flaskSbml2matlabApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ui.bootstrap',
  'ui.ace'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
