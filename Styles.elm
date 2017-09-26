module Styles exposing (..)

import Color
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font


type Styles
    = None
    | Avatar
    | Aside
    | AsideLink
    | Content
    | Name
    | Bullet
    | DotEmpty
    | DotFull
    | Entry
    | LastEntry
    | HeaderIcon
    | DetailsIcon
    | IconWrapper
    | Heading
    | SideHeading
    | SubHeading
    | HairLine
    | Period
    | Location
    | LineFlow
    | SkillCat
    | SkillTag


stylesheet : StyleSheet Styles variation
stylesheet =
    let
        baseFontSize =
            16

        blue =
            -- CornflowerBlue
            Color.rgb 100 149 237

        beige =
            -- EBE7E5
            Color.rgb 235 231 229

        grey =
            -- 3C3A38
            Color.rgb 60 58 56
    in
    Style.styleSheet
        [ style None
            [ Font.size baseFontSize
            , font Normal
            , Font.lineHeight 1.3
            ]
        , style Avatar
            [ Border.all 1
            , Color.border <| beige
            ]
        , style Aside
            [ Color.background <| blue
            , Color.text beige
            ]
        , style AsideLink
            [ Color.text beige
            ]
        , style Name
            [ Font.size (2.0 * baseFontSize)
            , Font.bold
            , font Title
            ]
        , style Heading
            [ Font.size (1.4 * baseFontSize)
            , font Title
            ]
        , style SubHeading
            [ Font.size (1.2 * baseFontSize)
            , Font.lineHeight 1.4
            , font Title
            ]
        , style SideHeading
            [ Font.size (1.4 * baseFontSize)
            , font Title
            ]
        , style Bullet
            [ Border.all 10
            , Color.border <| blue
            , Color.background beige
            ]
        , style DotEmpty
            [ Border.all 1
            , Color.border <| beige
            , Color.background blue
            ]
        , style DotFull
            [ Color.background beige
            ]
        , style HeaderIcon
            [ Color.background blue
            ]
        , style DetailsIcon
            [ Color.text beige
            ]
        , style Content
            [ Color.background <| beige
            ]
        , style Entry
            [ Border.left 10
            , Color.border <| blue
            ]
        , style LastEntry
            [ Border.left 10
            , Color.border <| beige
            ]
        , style HairLine
            [ Border.bottom 4
            , Color.border <| blue
            ]
        , style Period
            [ Font.size <| 0.9 * baseFontSize
            , Color.text grey
            ]
        , style Location
            [ Font.italic
            ]
        , style SkillCat
            [ Font.bold ]
        , style SkillTag
            [ Color.background beige
            , Color.text grey
            , Border.rounded 4
            , Font.size <| 0.7 * baseFontSize
            , Font.bold
            ]
        ]



-- Helpers


type FontType
    = Title
    | Normal


font : FontType -> Property class variation
font f =
    case f of
        Normal ->
            Font.typeface [ "DejaVu", "Arial" ]

        Title ->
            Font.typeface [ "Roboto Slab", "DejaVu", "Arial" ]
