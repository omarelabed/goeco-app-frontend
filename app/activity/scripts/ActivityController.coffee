angular
  .module('activity')
  .controller 'ActivityController', ($scope, supersonic, $timeout, uiGmapGoogleMapApi, Route) ->
    
    supersonic.data.channel('map_channel').subscribe (message) ->
        route = new Route(message.content)
        $scope.map =
            center:
                latitude: 45.8430360665
                longitude: 9.0182117607
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
                      weight: 6
                      opacity: 0.7
                    geodesic: true
                    visible: true
                }
                {
                    id: 2
                    path: route.activities[1].trackPoints
                    stroke:
                      color: '#6060FB'
                      weight: 3
                    geodesic: true
                    visible: true
                }
            ]
            $scope.marker =
                id: 0
                coords:
                    latitude: 45.8430360665
                    longitude: 9.0182117607
                icon: 
                    url: "http://maps.google.com/mapfiles/kml/pal4/icon54.png"
                events: 
                    click: (marker, eventName, args) ->
                        console.log 'click event'
                        options =
                            message: "Please reply honestly, now."
                            buttonLabels: ["Bike", "Car", "Horse"]
                        supersonic.ui.dialog.confirm("Are you awesome?", options).then (result) ->
                            console.log result
                            if result is 0
                                $scope.marker.icon.url = "http://maps.google.com/mapfiles/kml/shapes/cycling.png"
                            else
                                $scope.marker.icon.url = "http://maps.google.com/mapfiles/kml/shapes/horsebackriding.png"
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