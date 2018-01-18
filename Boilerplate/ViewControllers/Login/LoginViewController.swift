//
//  LoginViewController.swift
//  Boilerplate
//
//  Created by Do Dinh Thy  Son  on 1/5/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

protocol LoginViewModelType {
    var username : Variable<String?> { get }
    var password : Variable<String?> { get }
}

class LoginViewController : ViewController {
    let formIsValidSubject = BehaviorSubject<Bool>(value:false)
    
    var viewModel : LoginViewModelType! = LoginViewModel()
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureView(){
    }
    
    override func configureViewModel(){
        usernameField.rx.text.bind(to: viewModel.username).disposed(by: bag)
        passwordField.rx.text.bind(to: viewModel.password).disposed(by: bag)
    }
}
