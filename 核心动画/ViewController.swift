//
//  ViewController.swift
//  核心动画
//
//  Created by Once on 15/7/15.
//  Copyright (c) 2015年 com.once*. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myLayer:CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.testLayerProperty()
    }
    
    @IBAction func startClicked(sender: AnyObject) {
//        self.testLayerProperty()
//        self.implicitAnimation()
//        self.caBasicAnimate()
//        self.newBasicAimate()
        self.newKeyFrameAnimate()
    }
    
    
    @IBAction func fallbackClicked(sender: AnyObject) {
        var subsArray=self.view.subviews as NSArray
        for view in subsArray{
            if view.isKindOfClass(UIImageView){
                view.removeAllAnimations()
            }
        }
    }
    
    
    @IBAction func stopClicked(sender: AnyObject) {
    }
    
   
    
    /**
    图层属性(CALayer)
    */
    func testLayerProperty(){
        myLayer=CALayer()
        myLayer.backgroundColor=UIColor.magentaColor().CGColor
        myLayer.borderColor=UIColor.orangeColor().CGColor
        myLayer.borderWidth=2.0
        //圆角
        myLayer.cornerRadius=10.0
        myLayer.shadowColor=UIColor.orangeColor().CGColor
        //偏移量
        myLayer.shadowOffset=CGSizeMake( 5.0, 5.0)
        //透明度(影印)
        myLayer.shadowOpacity=0.5
        
        myLayer.frame=CGRectMake(100, 100, 100, 100)
        
        self.view.layer.addSublayer(myLayer)
    }

    /**
    隐式动画
    */
    func implicitAnimation(){
        myLayer.position.y+=30
    }
    
    
    /**
    显示动画
    */
    func newBasicAimate(){
        var imageView=UIImageView(image: UIImage(named: "1.jpg")!)
        imageView.frame=CGRectMake(150, 200, 100, 100)
        self.view.addSubview(imageView)
        
        //1.选定角色CALayer
        var layer=imageView.layer
        
        //2.写第一个剧本CAAnimatiom
        //让缩放
        var scaleAnimate=CABasicAnimation(keyPath: "transform.scale")
        //缩放倍数
        scaleAnimate.fromValue=1.0
        //放大倍数
        scaleAnimate.toValue=1.5
        scaleAnimate.autoreverses=true
        //无线循环
        scaleAnimate.repeatCount=MAXFLOAT
        //时间
        scaleAnimate.duration=2.0
        
        
        //3.第二个剧本用来透明
        
        var opaqueAnimate=CABasicAnimation(keyPath: "opacity")
        //透明
        opaqueAnimate.fromValue=0.0
        opaqueAnimate.toValue=1.0
        opaqueAnimate.autoreverses=true
        opaqueAnimate.repeatCount=MAXFLOAT
        opaqueAnimate.duration=2.0
        
        
        //4.把剧本交给演员开始动画
        layer.addAnimation(scaleAnimate, forKey: "scaleAnimate ")
        layer.addAnimation(opaqueAnimate, forKey: "opaqueAnimate")
    }
    
    /**
    关键帧动画
    */
    func newKeyFrameAnimate(){
        var imageView=UIImageView(image: UIImage(named: "1.jpg")!)
        imageView.frame=CGRectMake(150, 200, 40, 40)
        self.view.addSubview(imageView)
        
        //1.选定角色CALayer
        var layer=imageView.layer
        
        //2.写剧本
        var  keyAnimate=CAKeyframeAnimation(keyPath: "position")
        //设定关键帧
        var value0=NSValue(CGPoint: layer.position)
        var value1=NSValue(CGPoint: CGPointMake(layer.position.x, layer.position.y+200))
        var value2=NSValue(CGPoint: CGPointMake(layer.position.x-150, layer.position.y+200))
        var value3=NSValue(CGPoint: CGPointMake(layer.position.x-150, layer.position.y))
        var value4=NSValue(CGPoint: layer.position)
        keyAnimate.values=[value0,value1,value2,value3,value4]
        
        //每段时间
        keyAnimate.keyTimes=[0.0,0.5,0.7,1]
        
        
        //改变速度
        var tf0=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        var tf1=CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        var tf2=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        var tf3=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        keyAnimate.autoreverses=false
        keyAnimate.repeatCount=MAXFLOAT
        keyAnimate.duration=3.0
        
        //start
        layer.addAnimation(keyAnimate, forKey: "keyAnimate")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

