'use strict'

angular.module 'flaskSbml2matlabApp'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.text = {}
  parser = new DOMParser()

  $scope.$watch 'text.sbml', (newVal, oldVal) ->
    if not newVal?
      return
    if newVal is oldVal
      return

    doc = parser.parseFromString(newVal, 'text/xml')
    if doc.getElementsByTagName('sbml').length > 0
      $http.post '/translate', {sbml: $scope.text.sbml}
        .then (res) ->
          $scope.text.matlab = res.data
    else
      $scope.text.matlab = ''
