//
//  IdentifiableError.swift
//  Weather
//
//  Created by Joe Vargas on 9/17/24.
//
import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
