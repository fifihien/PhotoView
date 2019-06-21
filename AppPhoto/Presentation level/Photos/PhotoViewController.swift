//
//  ViewController.swift
//  AppPhoto
//
//  Created by Hien on 6/20/19.
//  Copyright © 2019 Hien Tran. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RxSwift


class ViewController: UIViewController {
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    var disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PhotoListUseCase(searchId: "searchKey", cursor: "nextCursor",
                         pageSize:"10" )
            .execute()
            .subscribe(onNext: { [weak self] (responseInfo) in
                print("Response here" )
                }, onError: { (error) in
                    print(error)
            }, onCompleted: {
                
            }).addDisposableTo(self.disposableBag)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

