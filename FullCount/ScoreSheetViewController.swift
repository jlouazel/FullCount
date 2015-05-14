//
//  ScoreSheetViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 13/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class ScoreSheetViewController: UIViewController, UIPageViewControllerDataSource {
	
	let nbBatters: Int = 9
	
	var pageViewController: UIPageViewController!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreSheetPageViewController") as! UIPageViewController
		
		self.pageViewController.dataSource = self
		
		var initialContenViewController = self.pageTutorialAtIndex(0) as ScoreSheetHolderViewController
		
		var viewControllers = NSArray(object: initialContenViewController)
		
		
		self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
		
		self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100)
		
		self.addChildViewController(self.pageViewController)
		self.view.addSubview(self.pageViewController.view)
		self.pageViewController.didMoveToParentViewController(self)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
	
	
	func pageTutorialAtIndex(index: Int) ->ScoreSheetHolderViewController
	{
		
		var pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreSheetHolderViewController") as! ScoreSheetHolderViewController

		pageContentViewController.pageIndex = index
		
		
		return pageContentViewController
		
	}
	
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
	{
		var viewController = viewController as! ScoreSheetHolderViewController
		var index = viewController.pageIndex as Int
		
		if(index == 0 || index == NSNotFound)
		{
			return nil
		}
		
		index--
		
		return self.pageTutorialAtIndex(index)
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
	{
		var viewController = viewController as! ScoreSheetHolderViewController
		var index = viewController.pageIndex as Int
		
		if((index == NSNotFound))
		{
			return nil
		}
		
		index++
		
		if(index == nbBatters)
		{
			return nil
		}
		
		return self.pageTutorialAtIndex(index)
	}
	
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
		return nbBatters
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
		return 0
	}
}