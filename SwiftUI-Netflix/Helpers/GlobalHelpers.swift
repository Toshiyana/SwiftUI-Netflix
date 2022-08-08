//
//  GlobalHelpers.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/07.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 1,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Boran bo Odan, Janje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6])

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Boran bo Odan, Janje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadLine: "Watch Season 2 Now")

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Boran bo Odan, Janje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [])

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Boran bo Odan, Janje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadLine: "Watch Season 4 Now")

let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 5,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Boran bo Odan, Janje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [])

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Boran bo Odan, Janje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadLine: "Watch Season 6 Now")

var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Beginers and Endings", description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
