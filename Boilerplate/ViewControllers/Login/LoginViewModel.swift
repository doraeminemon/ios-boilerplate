//
//  LoginViewModel.swift
//  Boilerplate
//
//  Created by Do Dinh Thy  Son  on 1/5/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import Foundation
import RxViewModel
import RxSwift
import Action

class LoginViewModel : RxViewModel, LoginViewModelType {
    var username = Variable<String?>(nil)
    var password = Variable<String?>(nil)
    
}
