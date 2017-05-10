//
//  Download.swift
//  MyQuiz
//
//  Created by Cntt34 on 5/10/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class Download: NSObject {

    var url: String
    var isDownloading = false
    var progress: Float = 0.0
    
    var downloadTask: URLSessionDownloadTask?
    var resumeData: NSData?
    
    init(url: String) {
        self.url = url
    }
}
