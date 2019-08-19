//
//  ViewController.swift
//  PhotosExample
//
//  Created by JieunKim on 01/08/2019.
//  Copyright © 2019 zieunv. All rights reserved.
//

import UIKit
import Photos

// MARK: take CameraRoll
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver {
    
    // PHPhotoLibraryChangeObserver - Library에 변화가 생기면 감지를 하는 Protocol
    @IBOutlet weak var tableView: UITableView!
    // 최신순으로 사진을 sort한 결과물을 fetchResult에 저장
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"
    
    // IBAction으로 refresh해주는 메서드 
    @IBAction func touchUpRefreshButton(_ sender: UIBarButtonItem) {
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
    // 어떤 row 값을 편집할 수 있게 할 것인가?
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 편집을 하려고 했을 때 삭제인지 ?
        if editingStyle == .delete {
            // 삭제라고 하면 실행해야할 것들
            let asset: PHAsset = self.fetchResult[indexPath.row]
            
            // 선언된 asset을 가지고 delete 작업을 할 것이다.
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
    }
    
    // MARK: 포토라이브러리가 바뀌면 호출되는 메서드
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult)
            else { return }
        fetchResult = changes.fetchResultAfterChanges
        
        // 포토라이브러리가 바뀌면 테이블 뷰를 다시 불러달라는 함수
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    func requestCollection() {
        // 사진찍으면 저장되는 camera
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        let fetchOptions = PHFetchOptions()
        
        // 최신순으로 사진을 sort 한 것
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationStatus {
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
        case .denied:
            print("접근 불허")
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        }
        // 포토라이브러리가 바뀐 것을 catch하기 위한 선언
        // 선언을 하고 나면 델리게이트 메서드가 호출된다.
        PHPhotoLibrary.shared().register(self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        // 조그마하게 만든 Asset size !!
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: 30, height: 30),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: { image, _ in cell.imageView?.image = image
        })
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // navigation controller가 동작하기 전에 호출하는 메서드
    // 데이터 전달 후 다음화면으로 넘어가게 한다.
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let nextViewController: ImageZoomController = segue.destination as? ImageZoomController else {
        return
    }
    
    guard let cell: UITableViewCell = sender as? UITableViewCell else {
        return
    }
    
    guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
        return
    }
    
    nextViewController.asset = self.fetchResult[index.row]
    }
}
