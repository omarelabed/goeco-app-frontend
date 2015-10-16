angular
  .module('sensors')
  .directive 'kitchensinkGoogleMaps', ($window, supersonic, Route) ->
    restrict: "E"
    template: """<div class="google-maps-container"></div>"""
    replace: true
    scope:
      position: "="
    link: ($scope, element, attr) ->
      route=[]
      $scope.activity = 
        duration: "adasd"
      # Create map element
      el = document.createElement "div"
      element.prepend el

      # Create map object on the map element
      demoMap = new google.maps.Map el,
        zoom: 13
        mapTypeId: google.maps.MapTypeId.ROADMAP
        disableDefaultUI: true
        draggable: true

      # Create map marker
      demoAccuracyCircle = new google.maps.Circle
        map: demoMap
        fillColor: "#00B5FF"
        fillOpacity: 0
        strokeColor: "#00B5FF"
        strokeOpacity: 0.5
        strokeWeight: 2

      # Create map marker
      demoMarker = new google.maps.Marker
        map: demoMap

      supersonic.data.channel('map_channel').subscribe (message) ->
        route = new Route(message.content)
        newLatLng = new google.maps.LatLng $scope.position.latitude, $scope.position.longitude
        demoMap.setCenter newLatLng
        demoMarker.setPosition newLatLng
        demoAccuracyCircle.setCenter newLatLng
        demoAccuracyCircle.setRadius $scope.position.accuracy
        activity1 = new google.maps.Polyline
          path: route.activities[0].trackPoints
          geodesic: true
          strokeColor:"#0000FF",
          strokeOpacity:0.5,
          strokeWeight:7
        activity1.setMap null
        activity1.setMap demoMap
        activity2 = new google.maps.Polyline
          path: route.activities[1].trackPoints
          geodesic: true
          strokeColor:"#9932CC",
          strokeOpacity:0.5,
          strokeWeight:7
        activity2.setMap null
        activity2.setMap demoMap
        return

      # Method for updating location
      updateLocation = ->
        newLatLng = new google.maps.LatLng $scope.position.latitude, $scope.position.longitude
        demoMap.setCenter newLatLng
        demoMarker.setPosition newLatLng
        demoAccuracyCircle.setCenter newLatLng
        demoAccuracyCircle.setRadius $scope.position.accuracy
        flightPlanCoordinates = [
          {
            'lat': 46.184656936
            'lng': 8.9880376607
          }
          {
            'lat': 46.1860344509
            'lng': 8.9922049711
          }
          {
            'lat': 46.1860240944
            'lng': 8.9921941145
          }
          {
            'lat': 46.1871929079
            'lng': 8.9944369331
          }
          {
            'lat': 46.1880778834
            'lng': 8.9963020324
          }
          {
            'lat': 46.1881059073
            'lng': 8.9963606139
          }
          {
            'lat': 46.189296749
            'lng': 8.9990789315
          }
          {
            'lat': 46.1894517831
            'lng': 8.9994565149
          }
          {
            'lat': 46.1906357245
            'lng': 9.012226289
          }
          {
            'lat': 46.1915650104
            'lng': 9.012968042
          }
          {
            'lat': 46.1916602287
            'lng': 9.0131135031
          }
          {
            'lat': 46.1918177029
            'lng': 9.0150596651
          }
          {
            'lat': 46.1912255519
            'lng': 9.0167866248
          }
          {
            'lat': 46.1912216947
            'lng': 9.0170149448
          }
          {
            'lat': 46.1920545128
            'lng': 9.0181485291
          }
          {
            'lat': 46.1921129187
            'lng': 9.0182546728
          }
        ]
        flightPath = new google.maps.Polyline
          path: route.activities[0].trackPoints
          geodesic: true
          strokeColor:"#0000FF",
          strokeOpacity:0.5,
          strokeWeight:7
        flightPath.setMap demoMap

      updateLocation2 = ->
        console.log route
        flightPath = new google.maps.Polyline
          path: route.activities[1].trackPoints
          geodesic: true
          strokeColor:"#0400EF",
          strokeOpacity:0.5,
          strokeWeight:7
        flightPath.setMap demoMap

      # Watch for changes in position
      $scope.$watch "position", ->
        # updateLocation2()
        console.log "niente"
      , true