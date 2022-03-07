//
//  ViewController.swift
//  ISpy
//
//  Created by Tai Chin Huang on 2022/3/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // (375.0, 812.0)
        print(view.bounds.size)
        // (1920.0, 1080.0)
        print(imageView.bounds.size)
        updateZoomFor(size: view.bounds.size)
    }
    // to zoom the size of imageView
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        /*
         find the minimum scale factor
         so the imageView based on scale factor can reach its size to
         width: ~1443(heightScale * 1920)
         height: ~210(widthScale * 1080)
         (也就是說imageView最小的寬高是375(不能低於375)/~210,最大寬高是~1443/812(不能高於812))
         */
        let scale = min(widthScale, heightScale)
//        let scale = max(widthScale, heightScale)
        print("widthScale:\(widthScale)")
        print("heightScale:\(heightScale)")
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
}

extension ViewController: UIScrollViewDelegate {
    // the view to scale when zooming
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
