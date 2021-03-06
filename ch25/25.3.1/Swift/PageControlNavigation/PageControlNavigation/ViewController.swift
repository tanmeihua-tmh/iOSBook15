//
//  ViewController.swift
//  PageControlNavigation
//
//  Created by 关东升 on 2016-11-18.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import UIKit

//定义获取屏幕宽度
let S_WIDTH: CGFloat = UIScreen.main.bounds.size.width
//定义获取屏幕高度
let S_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

class ViewController: UIViewController, UIScrollViewDelegate {

    var page1: UIImageView!
    var page2: UIImageView!
    var page3: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: S_WIDTH * 3, height: S_HEIGHT)

        self.page1 = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: S_WIDTH, height: S_HEIGHT))
        self.page1.image = UIImage(named: "达芬奇-蒙娜丽莎.png")

        self.page2 = UIImageView(frame: CGRect(x: S_WIDTH, y: 0.0, width: S_WIDTH, height: S_HEIGHT))
        self.page2.image = UIImage(named: "罗丹-思想者.png")

        self.page3 = UIImageView(frame: CGRect(x: 2 * S_WIDTH, y: 0.0, width: S_WIDTH, height: S_HEIGHT))
        self.page3.image = UIImage(named: "保罗克利-肖像.png")

        self.scrollView.addSubview(page1)
        self.scrollView.addSubview(page2)
        self.scrollView.addSubview(page3)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //实现UIScrollViewDelegate协议中方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        self.pageControl.currentPage = Int(offset.x) / Int(S_WIDTH)
    }

    @IBAction func changePage(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3, animations: {
            let whichPage = self.pageControl.currentPage
            self.scrollView.contentOffset = CGPoint(x: S_WIDTH * CGFloat(whichPage), y: 0)
        })
    }
}

