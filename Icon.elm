module Icon exposing (..)

import Element exposing (Element, el, html)
import Element.Attributes exposing (..)
import Styles exposing (..)
import Svg exposing (svg, use)
import Svg.Attributes exposing (xlinkHref)


load : String -> Int -> Element Styles variation msg
load symbol size =
    el None
        [ center, verticalCenter ]
        (html
            (svg
                [ Svg.Attributes.width <| toString size, Svg.Attributes.height <| toString size ]
                [ use [ xlinkHref ("#icon-" ++ symbol) ] [] ]
            )
        )


large : String -> Element Styles variation msg
large symbol =
    load symbol 22


small : String -> Element Styles variation msg
small symbol =
    load symbol 18
