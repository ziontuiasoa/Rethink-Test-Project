//
//  UserView.swift
//  Rethink Test Project
//
//  Created by Kevin Hartley on 7/17/23.
//

import SwiftUI

struct UserView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(.orange)
            Text(user.name)
        }
    }
}
