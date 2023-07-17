//
//  CustomButton.swift
//  Rethink Test Project
//
//  Created by Kevin Hartley on 7/17/23.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(.orange))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .padding()
    }
}
