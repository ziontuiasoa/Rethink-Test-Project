//
//  ListItem.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation

protocol ListItemConvertable {
    func asListItem() -> ListItem
}

struct ListItem: Identifiable {
    var id = UUID()
    var itemType: ItemType
    var children: [ListItem]?
}

indirect enum ItemType {
    case user(User)
    case post(Post)
    case comment(Comment)
    case info(String)
}