dredge.controller 'DredgeCtrl',
  ($scope, PriceFactory) ->
    promise = PriceFactory.getPricesByRelease(1)
    promise.then (data) -> $scope.prices = data