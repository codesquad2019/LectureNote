//
//  ImageZoomController.swift
//  PhotosExample
//
//  Created by JieunKim on 14/08/2019.
//  Copyright © 2019 zieunv. All rights reserved.
//

import UIKit
import Photos

class ImageZoomController: UIViewController, UIScrollViewDelegate {
    
    var asset: PHAsset!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView: UIImageView!
    
    // 스크롤 뷰가 zoom을 해줄 것이 어떤 것인가 ?
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // imageView를 return해준다.
        return self.imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // asset에서 이미지를 호출해달라.
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in self.imageView.image = image
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
