//
//  waitingChatsNavigation.swift
//  IChat
//
//  Created by Яна Балковская on 26.09.22.
//

import Foundation

protocol WaitingChatsNavigation: class {
    func removeWaitingChat(chat: MChat)
    func chatToActive(chat: MChat)
}
