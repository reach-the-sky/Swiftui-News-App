//
//  NewsTemplate.swift
//  Developer News
//
//  Created by Kotni Krishna Chaitanya on 20/03/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct News: Codable, Hashable, Identifiable{    // Structure of the json file that is loaded
    var id: Int
    var title: String
    var url: String?
    var score: Int
    var by: String
}
