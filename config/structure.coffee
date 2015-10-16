# Read more about app structure at http://docs.appgyver.com

module.exports =

  # See styling options for tabs and other native components in app/common/native-styles/ios.css or app/common/native-styles/android.css
  # tabs: [
  #   {
  #     title: "Menu"
  #     id: "menu"
  #     location: "menu#menu" # Supersonic module#view type navigation
  #   }
  #   {
  #     title: "Settings"
  #     id: "settings"
  #     location: "settings#settings"
  #   }
    # {
    #   title: "Internet"
    #   id: "internet"
    #   location: "http://google.com" # URLs are supported!
    # }
  # ]

  rootView:
    id: "login"
    location: "login#login"

  preloads: [

    {
      id: "login"
      location: "login#login"
    }

    {
      id: "menu"
      location: "menu#menu"
    }

    {
      id: "settings"
      location: "settings#settings"
    }

    {
      id: "weeks"
      location: "weeks#weeks"
    }

    {
      id: "days"
      location: "days#days"
    }

    {
      id: "routes"
      location: "routes#routes"
    }

    {
      id: "geolocation"
      location: "sensors#geolocation"
    }

    {
      id: "activity"
      location: "activity#activity"
    }
    # Navigation & transitions

    # {
    #   id: "navigation-layerPush"
    #   location: "navigation#layerPush"
    # }

    # {
    #   id: "navigation-modalWindow"
    #   location: "navigation#modalWindow"
    # }

    # {
    #   id: "navigation-transitions"
    #   location: "navigation#transitions"
    # }

    # # Sensors

    # {
    #   id: "sensors-geolocation"
    #   location: "sensors#geolocation"
    # }

    # {
    #   id: "sensors-compass"
    #   location: "sensors#compass"
    # }

    # {
    #   id: "sensors-accelerometer"
    #   location: "sensors#accelerometer"
    # }

    # # Status

    # {
    #   id: "status-network"
    #   location: "status#network"
    # }

  ]

  drawers:
    left:
      id: "drawer-content"
      location: "drawer#content"
      showOnAppLoad: false
    options:
      animation: "swingingDoor"

  # initialView:
  #   id: "login"
  #   location: "login#login"
