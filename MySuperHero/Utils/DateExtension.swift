//
//  DateExtension.swift
//  MySuperHero
//
//  Created by Fikri Adriansa Yudha on 26/05/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Foundation

extension Date {
  init?(ISO8601: String) {
    let isoFormatter = ISO8601DateFormatter()

    guard let date = isoFormatter.date(from: ISO8601) else { return nil }
    self = date
  }
}
