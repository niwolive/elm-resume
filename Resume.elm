module Resume exposing (..)

import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import Icon
import Styles exposing (..)


type alias EntryRecord =
    { title : String, period : String, location : String, description : List String }


contentWidth : Float
contentWidth =
    480


asideWidth : Float
asideWidth =
    310


main : Html msg
main =
    let
        intent =
            column
                None
                []
                [ heading "Intent"
                , el Entry [ height <| px 20 ] empty
                , el LastEntry [ paddingLeft 20 ] (subHeading "Join a small pod of software enthusiasts helping scale their codebase, improve user experience and enrich the team's culture.")
                ]

        experience =
            column
                None
                []
                (List.concat
                    [ [ heading "Experience" ]
                    , entries
                        [ { title = "Freelance developer"
                          , period = "Apr. 2017 → Present"
                          , location = "Taiwan, New-Zealand and France"
                          , description =
                                [ "Prototype UIs, help teams (e.g. @Zengularity) « release early and release often » using Elm, React.js and/or Elixir." ]
                          }
                        , { title = "Co-founder and tech lead"
                          , period = "May 2014 → Sep. 2017"
                          , location = "@Tealure, Denmark"
                          , description =
                                [ "Develop/maintain a tailored e-commerce solution (Rails/React.js), ensure tech aspects of the business align with strategic goals and mentor interns." ]
                          }
                        , { title = "Bootcamp trainer"
                          , period = "Oct. 2016 → Jan. 2017"
                          , location = "@ISTC, Armenia"
                          , description =
                                [ "Form a backend development course for a 10-week bootcamp."
                                , "Pair with a senior to teach modern Javascript and Node.js prioritizing fundamental concepts over breadth of knowledge."
                                ]
                          }
                        , { title = "Teaching assistant"
                          , period = "Aug. 2015 → Jan. 2016"
                          , location = "@KEA, Denmark"
                          , description =
                                [ "Teach Software Testing, Human Computer Interfaces and web technologies." ]
                          }
                        ]
                    ]
                )

        volunteer =
            column
                None
                []
                [ heading "Volunteering and open-source"
                , el Entry [ height <| px 20 ] empty
                , el LastEntry [ paddingLeft 20 ] (subHeading "I contribute to their impact:")
                , wrappedRow
                    None
                    [ paddingTop 20, spacing 10 ]
                    [ column None
                        [ height <| px 80, width <| px 80 ]
                        [ link "http://enspiral.com" <|
                            el None [] <|
                                image "http://zaunders.net/images/Enspiral-Black-02.png" None [ height <| px 80, width <| px 80 ] empty
                        ]
                    , column
                        None
                        []
                        [ link "http://foodsharing.tw" <|
                            el None [] <|
                                image "https://grants.g0v.tw/uploads/74ef095365fea25a5ffc18dc53bd4840.png" None [ height <| px 80, width <| px 80 ] empty
                        ]
                    , column
                        None
                        []
                        [ link "http://elm-lang.org" <|
                            el None [] <|
                                image "https://frontendmasters.com/assets/Elm.png" None [ height <| px 80, width <| px 80 ] empty
                        ]
                    , column
                        None
                        []
                        [ link "http://g0v.asia" <|
                            el None [] <|
                                image "http://data.g0v.tw/sites/default/files/styles/large/public/g0v-2line-black-s_0.png?itok=RdjlPFnQ" None [ height <| px 80, width <| px 80 ] empty
                        ]
                    , column None
                        []
                        [ link "http://buckybox.com" <|
                            el None [] <|
                                image "https://pbs.twimg.com/profile_images/1615075076/Bucky-icon-transparent_400x400.png"
                                    None
                                    [ height <| px 80, width <| px 80 ]
                                    empty
                        ]
                    ]
                ]

        education =
            column
                None
                []
                (List.concat
                    [ [ heading "Education" ]
                    , entries
                        [ { title = "MSc. in Software Engineering"
                          , period = "2010 → 2013"
                          , location = "@University of Technology in Troyes, France"
                          , description = []
                          }
                        ]
                    ]
                )
    in
    Element.layout stylesheet <|
        row None
            [ center
            , inlineStyle [ ( "-webkit-print-color-adjust", "exact" ) ]
            ]
            [ column Content
                [ width <| px contentWidth
                , spacing 30
                , padding 20
                , inlineStyle [ ( "-webkit-print-color-adjust", "exact" ) ]
                ]
                [ intent
                , experience
                , education
                , volunteer
                ]
            , aside
            ]


aside : Element Styles variation msg
aside =
    let
        photo =
            el None [] <| text "Introduction"

        header =
            column None
                [ spacing 10 ]
                [ circle 110 Avatar [ paddingBottom 15, center, clip ] <|
                    image "https://cloudinary-a.akamaihd.net/hopwork/image/upload/h_110,w_110,c_thumb,g_face,z_0.4,q_auto,dpr_2.0/huy47yzfugtsrxhfymtr.webp" None [] empty
                , el Name [ center ] <| text "Nicolas Wormser"
                , el None [ center ] <| text "FRONTEND & UX ENGINEER"
                , textLayout None
                    []
                    [ details "envelop" <| text "nicolas@codewithflair.org"
                    , details "phone" <| text "+886.905497627"
                    , details "linkedin" <|
                        link "http://linkedin.com/in/niwolive" <|
                            el AsideLink [] (text "linkedin.com/in/niwolive")
                    , details "github" <|
                        link "http://github.com/niwolive" <|
                            el AsideLink [] (text "github.com/niwolive")
                    ]
                ]

        vocation =
            column
                None
                []
                [ sideHeading "Skills"
                , textLayout None
                    []
                    [ dotPerf SkillCat [ paddingBottom 5 ] "Functional Programming" 4
                    , skillTags [ "Elm", "Ramda", "Elixir", "StandardML" ]
                    , dotPerf SkillCat [ paddingTop 8, paddingBottom 5 ] "View & templating" 4
                    , skillTags [ "React.js", "Web Components", "Liquid" ]
                    , dotPerf SkillCat [ paddingTop 8, paddingBottom 5 ] "App. architecture" 3
                    , skillTags [ "Flux", "The Elm Arch.", "API-centric" ]
                    , dotPerf SkillCat [ paddingTop 8, paddingBottom 5 ] "Rapid prototyping" 4
                    , skillTags [ "Jekyll", "RubyOnRails", "style-elements" ]
                    , dotPerf SkillCat [ paddingTop 8, paddingBottom 5 ] "Agile" 4
                    , skillTags [ "Test-Driven Dev.", "GitFlow", "Pair prog.", "CI" ]
                    , dotPerf SkillCat [ paddingTop 8, paddingBottom 5 ] "Usability Testing" 2
                    , skillTags [ "Guerilla", "think aloud", "A/B testing" ]
                    , dotPerf SkillCat [ paddingTop 8, paddingBottom 5 ] "Soft Skills" 4
                    , skillTags [ "Pomodoro", "mentoring", "disruptive thinking" ]
                    ]
                ]

        hobbies =
            column
                None
                []
                [ sideHeading "Hobbies & interests"
                , textLayout None
                    []
                    [ el None [] <| text "Artisan bread"
                    , el None [] <| text "Civic technology"
                    , el None [] <| text "Self development"
                    ]
                ]

        languages =
            column
                None
                []
                [ sideHeading "Natural languages"
                , textLayout None
                    []
                    [ dotPerf None [] "French" 5
                    , dotPerf None [] "English" 5
                    , dotPerf None [] "Chinese" 1
                    ]
                ]
    in
    column Aside
        [ width <| px asideWidth
        , padding 20
        , spacing 30
        ]
        [ header
        , vocation
        , languages
        , hobbies
        ]


heading : String -> Element Styles varation msg
heading s =
    row None
        [ spacing 20 ]
        [ iconFor s
        , el Heading [ paddingTop 4 ] (text s) |> below [ hl ]
        ]


subHeading : String -> Element Styles varation msg
subHeading title =
    el SubHeading [] (text title)
        |> onLeft [ bullet ]


sideHeading : String -> Element Styles varation msg
sideHeading title =
    el SideHeading [ paddingBottom 7 ] (text title)


headerIcon : String -> Element Styles variation msg
headerIcon name =
    el IconWrapper
        [ height <| px 37, width <| px 10 ]
    <|
        circle
            19
            HeaderIcon
            [ center, paddingTop 5 ]
            (Icon.large name)


bullet : Element Styles variation msg
bullet =
    el None
        [ height <| px 24, width <| px 50 ]
    <|
        circle
            13
            Bullet
            [ alignBottom, center ]
            empty


hl : Element Styles variation msg
hl =
    el HairLine
        [ width <| px 390 ]
        empty


entries : List EntryRecord -> List (Element Styles variation msg)
entries es =
    case es of
        [] ->
            []

        x :: [] ->
            [ entry x LastEntry ]

        x :: xs ->
            entry x Entry :: entries xs


entry : EntryRecord -> Styles -> Element Styles variation msg
entry { title, period, location, description } style =
    column
        None
        []
        [ el Entry [ height <| px 20 ] empty
        , column
            style
            [ paddingLeft 20 ]
            [ row None
                []
                [ subHeading title
                , el None [ width <| fill 1 ] (el Period [ alignRight, verticalCenter ] <| text period)
                ]
            , el Location [ paddingBottom 10 ] (text location)
            , textLayout None [] <|
                List.map (\x -> el None [] <| text x) description
            ]
        ]


iconFor : String -> Element Styles variation msg
iconFor name =
    case name of
        "Intent" ->
            headerIcon "quill"

        "Experience" ->
            headerIcon "briefcase"

        "Education" ->
            headerIcon "library"

        "Volunteering and open-source" ->
            headerIcon "heart"

        _ ->
            empty


dotPerf : Styles -> List (Attribute variation msg) -> String -> Int -> Element Styles variation msg
dotPerf style attr str score =
    let
        dot : Bool -> Element Styles variation msg
        dot full =
            circle
                4
                (if full then
                    DotFull
                 else
                    DotEmpty
                )
                []
                empty

        perf : Int -> List (Element Styles variation msg)
        perf acc =
            case acc <= 5 of
                False ->
                    []

                True ->
                    dot (acc <= score) :: perf (acc + 1)
    in
    row None
        attr
        [ el style [ width <| fill 1 ] <| text str
        , row None [ verticalCenter, spacing 5 ] <| perf 1
        ]


details : String -> Element Styles variation msg -> Element Styles variation msg
details icon element =
    row
        None
        [ spacing 10 ]
        [ el DetailsIcon [] <| Icon.small icon
        , element
        ]


skillTags : List String -> Element Styles variation msg
skillTags tags =
    row None
        [ spacing 5 ]
        (List.map
            (\t -> el SkillTag [ paddingXY 5 2 ] <| text t)
            tags
        )
