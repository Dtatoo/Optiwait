./GooglePlaces/Main.elm:module GooglePlaces.Main exposing (..)
./GooglePlaces/Main.elm:import GooglePlaces.Model as PlacesModel
./GooglePlaces/Main.elm:import GooglePlaces.PlacesDecoder as PlacesDecoder
./GooglePlaces/Main.elm:    PlacesModel.GooglePlaces
./GooglePlaces/Main.elm:        FetchSuccess googlePlaces ->
./GooglePlaces/Main.elm:            ( googlePlaces, Cmd.none )
./GooglePlaces/Main.elm:            "https://maps.googleapis.com/maps/api/place/autocomplete/json"
./GooglePlaces/Main.elm:            Http.get PlacesDecoder.decodeGooglePlaces urlWithQuery
./GooglePlaces/Main.elm:        [ h1 [] [ text "Google Place Test" ]
./GooglePlaces/Model.elm:module GooglePlaces.Model exposing (..)
./GooglePlaces/Model.elm:type alias GooglePlaces =
./GooglePlaces/Model.elm:init : GooglePlaces
./GooglePlaces/Model.elm:    GooglePlaces "" [ initComplexType ]
./GooglePlaces/PlacesDecoder.elm:module GooglePlaces.PlacesDecoder exposing (..)
./GooglePlaces/PlacesDecoder.elm:import GooglePlaces.Model
./GooglePlaces/PlacesDecoder.elm:        ( GooglePlaces
./GooglePlaces/PlacesDecoder.elm:parse : String -> Result String GooglePlaces
./GooglePlaces/PlacesDecoder.elm:    decodeString decodeGooglePlaces json
./GooglePlaces/PlacesDecoder.elm:decodeGooglePlaces : Decoder GooglePlaces
./GooglePlaces/PlacesDecoder.elm:decodeGooglePlaces =
./GooglePlaces/PlacesDecoder.elm:    Json.decode GooglePlaces
./Messages.elm:import GooglePlaces.Main as GooglePlaces
./Messages.elm:    | SignupMsg GooglePlaces.Msg
./Models.elm:import GooglePlaces.Main as GooglePlaces
./Models.elm:    , signupPage : GooglePlaces.Model
./Models.elm:    , signupPage = GooglePlaces.init
./Update.elm:import GooglePlaces.Main as GooglePlaces
./Update.elm:                    GooglePlaces.update subMsg model.signupPage
./View.elm:import GooglePlaces.Main as Signup
