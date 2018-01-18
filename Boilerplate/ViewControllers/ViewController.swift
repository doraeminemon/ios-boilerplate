//
//  ViewController.swift
//  Boilerplate
//
//  Created by Viet Nguyen Tran on 11/8/16.
//  Copyright © 2016 Innovatube. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        configureViewModel()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    open func configureView(){
        fatalError("MUST SUBCLASS")
    }
    
    open func configureViewModel(){
        fatalError("MUST SUBCLASS")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

