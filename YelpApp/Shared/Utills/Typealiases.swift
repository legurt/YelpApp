//
//  Typealiases.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import Foundation

public typealias NetworkClosure<T> = (Result<T, Error>) -> Void
