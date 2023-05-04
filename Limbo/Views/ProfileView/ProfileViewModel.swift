//
//  ProfileViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var oldPassword = ""
    @Published var newPassword = ""
    @Published var repeatNewPassword = ""
}
