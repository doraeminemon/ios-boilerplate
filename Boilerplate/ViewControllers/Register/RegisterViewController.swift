//
//  RegisterViewController.swift
//  Boilerplate
//
//  Created by Do Dinh Thy  Son  on 1/7/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxOptional
import Then
import RxSwiftExt

class RegisterViewController : ViewController {
    let emailField = UITextField().then {
        $0.placeholder = "Email"
    }
    let emailValidLabel = UILabel().then {
        $0.textColor = .red
    }
    let passwordField = UITextField().then {
        $0.placeholder = "Password"
    }
    let passwordValidLabel = UILabel().then {
        $0.textColor = .red
    }
    let repeatPasswordField = UITextField().then {
        $0.placeholder = "Repeat Password"
    }
    let repeatPasswordValidLabel = UILabel().then {
        $0.textColor = .red
    }
    let submitButton = UIButton().then {
        $0.setTitle("Submit", for: .normal)
        $0.setTitleColor($0.tintColor, for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .disabled)
    }
    
    let formIsValidSubject = BehaviorSubject<Bool>(value:false)
    
    override func configureView(){
        let stackView = UIStackView().then {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 20
            $0.addArrangedSubview(emailField)
            $0.addArrangedSubview(emailValidLabel)
            $0.addArrangedSubview(passwordField)
            $0.addArrangedSubview(passwordValidLabel)
            $0.addArrangedSubview(repeatPasswordField)
            $0.addArrangedSubview(repeatPasswordValidLabel)
            $0.addArrangedSubview(submitButton)
        }
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.85)
        }
    }

    override func configureViewModel(){
        //Disable button on invalid
        let emailFieldValidated = emailField.rx.text.filterNil().validate(with: isEmail(value:)).materialize()
        let passwordFieldValidated = passwordField.rx.text.filterNil().validate(with: isPassword(value:)).materialize()
        let repeatPasswordValidated = repeatPasswordValid().materialize()
        
        Observable.combineLatest(
            emailFieldValidated.debug(),
            passwordFieldValidated.debug(),
            repeatPasswordValidated.debug()
        ) { $0.element != nil && $1.element != nil && $2.element != nil }
            .asDriver(onErrorJustReturn: false)
            .drive(submitButton.rx.isEnabled)
            .disposed(by: bag)
        // Print invalid on label
        emailFieldValidated.errors()
            .map(String.init(describing:))
            .bind(to: emailValidLabel.rx.text)
            .disposed(by:bag)
        passwordFieldValidated
            .map(String.init(describing:))
            .bind(to: passwordValidLabel.rx.text)
            .disposed(by:bag)
        repeatPasswordValid().materialize().errors()
            .map(String.init(describing:))
            .bind(to: repeatPasswordValidLabel.rx.text)
            .disposed(by:bag)
    }
    
    func repeatPasswordValid() -> Observable<Void> {
        return Observable.combineLatest(
        passwordField.rx.text,
        repeatPasswordField.rx.text)
        { $0 == $1 ? nil : "Repeat password must match password" }
            .flatMap { (string : String?) -> Observable<Void> in
                if let string = string {
                    return Observable.error(ValidationError(message: string))
                } else {
                    return Observable.never(())
                }
            }
    }
}

struct ValidationError : Swift.Error, CustomDebugStringConvertible {
    let message : String
    var debugDescription: String {
        return message
    }
}

extension ObservableType {
    func validate(with validator: @escaping (E) -> Observable<Void>) -> Observable<Void> {
        return flatMap(validator)
    }
    
    static func never(_ value: E) -> Observable<E> {
        return Observable.create {
            $0.onNext(value)
            return Disposables.create()
        }
    }
}

func isEmail(value: String) -> Observable<Void> {
    guard value.count > 3 else { return Observable.error(ValidationError(message:"Email must be at least 3 characters")) }
    guard (value.filter { $0 == "@" } as String).count == 1 else { return Observable.error(ValidationError(message: "Email must contains only 1 @ character")) }
    return Observable.never(())
}

func isPassword(value:String) -> Observable<Void> {
    guard value.count > 3 else { return Observable.error(ValidationError(message:"Password must be at least 7 characters")) }
    return Observable.never(())
}


