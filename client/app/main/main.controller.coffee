'use strict'

angular.module 'flaskSbml2matlabApp'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.text = {}
  parser = new DOMParser()

  $scope.$watch 'text.sbml', (newVal) ->
    if not newVal?
      return

    doc = parser.parseFromString($scope.text.sbml, 'text/xml')
    if doc.getElementsByTagName('sbml').length > 0
      alert 'Valid SBML!'

