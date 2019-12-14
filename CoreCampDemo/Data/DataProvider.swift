//
//  DataProvider.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/6/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import Foundation

class DataProvider {
    static let topVideos = [
        VideoModel(title: "The DC Promo Video",
                   descriprion: "We could throw a million superlatives into this caption, but why waste time? T-Funk sparks it, Evan and Wes share a few face-melting minutes and Tiago detonates a legendary part to bring down the curtains. Wow...",
                   youtubeId: "b4U1b7z9sPA",
                   skaters: [
                    SkaterModel(firstName: "Tristan", lastName: "Funkhouser", monoImageUrl: URL(string: "https://soloskatemag.com/upload/Storage/soloskatemag_t-funk_tumblrtime_pic.jpg")!),
                    SkaterModel(firstName: "Evan", lastName: "Smith", monoImageUrl: URL(string: "https://i0.heartyhosting.com/www.dewtour.com/wp-content/uploads/2016/05/DEW-TOUR-Evan-Smith-Team-Challenge.jpg?resize=300%2C300&ssl=1")!),
                    SkaterModel(firstName: "Wes", lastName: "Kremer", monoImageUrl: URL(string: "https://theboardr.blob.core.windows.net/headshots/1489_900.jpg")!),
                    SkaterModel(firstName: "Tiago", lastName: "Lemos", monoImageUrl: URL(string: "https://image-cdn.hypb.st/http%3A%2F%2Fberrics.hypebeast.com%2Ffiles%2F2019%2F09%2Ftiago-1.jpg?w=1600&cbr=1&q=90&fit=max")!),
                    //                   SkaterModel(firstName: "aaa", lastName: "aaa", monoImageUrl: URL(string: "aaaa")!),
            ],
                   durationSeconds: 1257),
        VideoModel(title: "Milton Martinez's \"¡DEMOLICIÓN!\" Part",
                   descriprion: "The madman from Mar del Plata, Argentina blazes at full throttle no matter the spot. This part is gonna put you on the edge of your seat, from the opening montage to the kickflip into you-know-what. Skate and Destroy!",
                   youtubeId: "7VkFK2JN5tA",
                   skaters: [SkaterModel(firstName: "Milton", lastName: "Martinez", monoImageUrl: URL(string: "https://theboardr.blob.core.windows.net/headshots/2835_900.jpg")!)],
                   durationSeconds: 612),
        VideoModel(title: "Mark Suciu's \"Verso\" Part",
                   descriprion: "Mark's Cross Continental part birthed a legend, but this one catapults him into the stratosphere. The fastest feet in the biz and an approach to skating without comparison, Suciu's Verso is an absolute gift. Enjoy the show...",
                   youtubeId: "SlcxbZbHTj8",
                   skaters: [
                    SkaterModel(firstName: "Mark", lastName: "Suciu", monoImageUrl: URL(string: "http://www.jenkemmag.com/home/wp-content/uploads/2019/09/Mark_Suciu_portrait.jpg")!),
            ],
                   durationSeconds: 695),
        VideoModel(title: "Nike SB Mexico | Vórtice",
                   descriprion: "The colors, the textures, the spots. A whirlwind video from the Nike SB Mexico team. This is Vórtice.",
                   youtubeId: "veSZRhi0VIw",
                   durationSeconds: 2080),
        VideoModel(title: "Volcom's \"Terminal Tourist\" Video",
                   descriprion: "Louie Lopez, GT, Pedro Barros, Provost and Milton Martinez dipped below the border to meet up with the Volcom South American team and spots were laid to waste! That BMX track is next level… Book your tickets now.",
                   youtubeId: "GWjqwsNlilI",
                   durationSeconds: 674),
        VideoModel(title: "New Balance \"The Second Narrows\"",
                   descriprion: "Great skating, fantastic filming, and some next level editing. Take the trip...",
                   youtubeId: "z0p6OXS30Gw",
                   durationSeconds: 447),
        VideoModel(title: "\"Beautiful Moment\" Full Video",
                   descriprion: "The Bay Area skate scene is more alive than ever, as evidenced here in the full-length video \"Beautiful Moment\" by local lensman Dayman Torelli.",
                   youtubeId: "EJdfjUQXqP8",
                   durationSeconds: 2465),
        VideoModel(title: "Chris \"Cookie\" Colbourn's \"Element Pro\" Part",
                   descriprion: "This part is several levels beyond PRO AF. Cookie’s skating is incredible and his elevation to the pro ranks is very much deserved. Congrats, dude!",
                   youtubeId: "paVYpUAI_vY",
                   durationSeconds: 384),
        VideoModel(title: "YOU GOOD? ft. Zion Wright, Jamie Foy, and Alex Midler",
                   descriprion: "For the past 10 months, Red Bull Skateboarding's finest have traveled around the world searching for unique skate spots, taking heavy slams, stacking insane clips, and making lifelong memories in the process. Featuring individual parts from Alex Midler, Jamie Foy, and Zion Wright, with appearances from Ryan Sheckler, Torey Pudwill, Alex Sorgente, Gustavo Ribeiro, and more!",
                   youtubeId: "V8h7sOUDklg",
                   durationSeconds: 1283),
        VideoModel(title: "adidas Skateboarding presents /// Law Of The Seas",
                   descriprion: "Silas Baxter-Neal, Shin Sanbongi and Dennis Durrant head out to the land down under to link up with fellow Australian and Japanese team riders. Watch as the teams unite over seas to rip up the Sydney streets.",
                   youtubeId: "2fnqXRC_Abc",
                   durationSeconds: 498),
        VideoModel(title: "Nike SB | Trust Fall",
                   descriprion: "We covered both sides of the Atlantic in our latest video shot by Ant Travis and Jacob Harris that will get you sparked to skate the streets. Trust that.",
                   youtubeId: "g9SdR9D4ZL4",
                   durationSeconds: 1412)
    ]
    static let newVideos = [
        VideoModel(title: "Nike SB | GIZMO",
                   descriprion: "In 1996, Elissa Steamer pushed her way into skateboarding’s spotlight with a stand-out style that transcended gender and commanded respect. Through video and grassroots touring, Elissa, whose nickname “GIZMO” her father bestowed upon her, became a favorite to many, inspiring generations of skateboarders for years to come. Proof that progression in skateboarding is more than just tricks.",
                   youtubeId: "9xydeo88D24",
                   durationSeconds: 1097),
        VideoModel(title: "Kevin Bækkel's \"Higher Power\" Part",
                   descriprion: "A savage Norwegian metal soundtrack is the perfect pairing for an absolute lunatic on urethane. Baekkel is out for blood. Get the hell out of his way.",
                   youtubeId: "tkS4wBONPZo",
                   durationSeconds: 292),
        VideoModel(title: "Creature \"CSFU\" Full Video Release",
                   descriprion: "Like a Frankenstein beast, the Creature guys together form a skate monster that destroys all terrain, and it definitely shows in this video. Here's Gravette, Bingaman, Conover, Reyes, Navs, Hitz, Parts, and the whole squad.",
                   youtubeId: "s0Nbkxy7E48",
                   durationSeconds: 3261),
        VideoModel(title: "Chris Russell's \"Die like a Devil\" Part",
                   descriprion: "The Muscle is a human wrecking ball, barreling through concrete waves under bridges and in the backyards of Southern California. Dude is a savage.",
                   youtubeId: "wdnFz-0lWS8",
                   durationSeconds: 246),
        VideoModel(title: "Welcome's \"Seance\" Video",
                   descriprion: "We live in a world of limitless content, but it ain’t all created equal. This full-length from Welcome is worth your full and undivided attention. Skateboarding is a beautiful thing...",
                   youtubeId: "j61fIGsmDJ8",
                   durationSeconds: 2114),
        VideoModel(title: "Primitive Skate \"Never\" video",
                   descriprion: "The majority of “Never” was filmed over the course of three months on filming trips to Athens, Paris and Shanghai with some additional footage that needed to see the light of day!",
                   youtubeId: "DO0bxZydsIs",
                   durationSeconds: 1842),
        VideoModel(title: "Pizza Skateboards' \"Beaks\" Video",
                   descriprion: "The Pizza squad headed back to the promised land of Spain and we’ll be damned if they didn’t DELIVER a fantastic video all the way 'round. Enjoy this delicious moment...",
                   youtubeId: "t2MMcxcpYxs",
                   durationSeconds: 883),
        VideoModel(title: "Santa Cruz's \"Til The End\" Video",
                   descriprion: "To say the Santa Cruz squad is stacked is an understatement. This vid showcases some soon-to-be household names, as well as the OGs. Now sit back and enjoy this feature presentation...",
                   youtubeId: "DiDaXrUQO6Q",
                   durationSeconds: 1288),
        VideoModel(title: "Richie Jackson's \"Death Skateboards\" Part",
                   descriprion: "Richie reminds us that there are no rules in skateboarding. Choose your own adventure. ",
                   youtubeId: "8gXpZmQ7j70",
                   durationSeconds: 376),
        VideoModel(title: "GoPro Skate: Streets of Tokyo",
                   descriprion: "Travel with the GoPro skate team of Chris Cole, Leticia Bufoni, Andrew Brophy, Sean Malto, and filmer Chris Ray as they push through Japan and immerse themselves into the culture with local pro Kota Ikeda, because sometimes a skate trip is about more than just stacking clips.",
                   youtubeId: "eE_j5TAhxeg",
                   durationSeconds: 491),
    ]
    
    class func randomVideos() -> [VideoModel] {
        return  (topVideos + newVideos).shuffled()
    }
}
