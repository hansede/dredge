dredge.factory 'PriceFactory',
  ($http, $q) ->
    getPricesByRelease: (release_id) ->
      d = $q.defer()
      $http.get("/release/#{release_id}/price")
        .success((data) -> d.resolve(data))
        .error((data) -> d.reject(data))
      d.promise