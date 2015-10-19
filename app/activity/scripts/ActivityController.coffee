angular
  .module('activity')
  .controller 'ActivityController', ($scope, supersonic, $timeout, uiGmapGoogleMapApi, Route) ->
    
    supersonic.data.channel('map_channel').subscribe (message) ->
        route = new Route(message.content)
        $scope.map =
            center:
                latitude: 46.0268462674
                longitude: 8.9617165582
            zoom: 13
            bounds: {}
        $scope.polylines = []
        uiGmapGoogleMapApi.then ->
            $scope.polylines = [
                {
                    id: 1
                    path: route.activities[0].trackPoints
                    stroke:
                      color: '#6060FB'
                      weight: 3
                      editable: true
                      draggable: false
                      geodesic: true
                      visible: true
                      icons: [ {
                          icon: path: google.maps.SymbolPath.BACKWARD_OPEN_ARROW
                          offset: '25px'
                          repeat: '50px'
                          } 
                      ]
                  }
                  {
                    id: 2
                    path: route.activities[1].trackPoints
                    stroke:
                      color: '#6060FB'
                      weight: 3
                      editable: true
                      draggable: false
                      geodesic: true
                      visible: true
                      icons: [ {
                          icon: path: google.maps.SymbolPath.BACKWARD_OPEN_ARROW
                          offset: '25px'
                          repeat: '50px'
                          } ]
                      }
                  ]
        return
    return


      # $scope.map =
      #   center:
      #     latitude: 40.1451
      #     longitude: -99.6680
      #   zoom: 4
      #   bounds: {}
      # $scope.polylines = []
      # uiGmapGoogleMapApi.then ->
      #   $scope.polylines = [
      #     {
      #       id: 1
      #       path: [
      #         {
      #           latitude: 45
      #           longitude: -74
      #         }
      #         {
      #           latitude: 30
      #           longitude: -89
      #         }
      #         {
      #           latitude: 37
      #           longitude: -122
      #         }
      #         {
      #           latitude: 60
      #           longitude: -95
      #         }
      #       ]
      #       stroke:
      #         color: '#6060FB'
      #         weight: 3
      #       editable: true
      #       draggable: true
      #       geodesic: true
      #       visible: true
      #       icons: [ {
      #         icon: path: google.maps.SymbolPath.BACKWARD_OPEN_ARROW
      #         offset: '25px'
      #         repeat: '50px'
      #       } ]
      #     }
      #     {
      #       id: 2
      #       path: [
      #         {
      #           latitude: 47
      #           longitude: -74
      #         }
      #         {
      #           latitude: 32
      #           longitude: -89
      #         }
      #         {
      #           latitude: 39
      #           longitude: -122
      #         }
      #         {
      #           latitude: 62
      #           longitude: -95
      #         }
      #       ]
      #       stroke:
      #         color: '#6060FB'
      #         weight: 3
      #       editable: true
      #       draggable: true
      #       geodesic: true
      #       visible: true
      #       icons: [ {
      #         icon: path: google.maps.SymbolPath.BACKWARD_OPEN_ARROW
      #         offset: '25px'
      #         repeat: '50px'
      #       } ]
      #     }
      #   ]
      #   return
      # return