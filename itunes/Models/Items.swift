//
//  Items.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import Foundation

// MARK: - Items
struct Items: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id = UUID()
    let wrapperType: WrapperType
    let kind: Kind?
    let collectionID, trackID: Int?
    let artistName: String
    let collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30: String?
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice, trackRentalPrice, collectionHDPrice, trackHDPrice: Double?
    let trackHDRentalPrice: Double?
    let releaseDate: String
    let collectionExplicitness: Explicitness
    let trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let contentAdvisoryRating: ContentAdvisoryRating?
    let shortDescription, longDescription: String?
    let hasITunesExtras: Bool?
    let artistID: Int?
    let artistViewURL: String?
    let copyright, resultDescription: String?
    let isStreamable: Bool?
    let collectionArtistName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
        case artistID = "artistId"
        case artistViewURL = "artistViewUrl"
        case copyright
        case resultDescription = "description"
        case isStreamable, collectionArtistName
    }
}

enum Explicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
    case cleaned = "cleaned"
}

enum ContentAdvisoryRating: String, Codable {
    case explicit = "Explicit"
    case pg = "PG"
    case pg13 = "PG-13"
    case r = "R"
    case clean = "Clean"
    case unrated = "Unrated"
    case g = "G"
    case nr = "NR"
    case m = "M"
    case ma15 = "MA15+"
}

enum Country: String, Codable {
    case usa = "USA"
    case aud = "AUS"
}

enum Currency: String, Codable {
    case usd = "USD"
    case aud = "AUD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song = "song"
    case podcast = "podcast"
}

enum WrapperType: String, Codable {
    case audiobook = "audiobook"
    case track = "track"
}

