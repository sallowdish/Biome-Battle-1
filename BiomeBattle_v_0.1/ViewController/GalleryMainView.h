//
//  GalleryView.h
//  BiomeBattle_v_0.1
//
//  Created by Rui Zheng on 6/21/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryMainView : UIView <UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *cardList;

@property (strong,nonatomic) NSMutableArray *deck;

//@property (strong,nonatomic) UIView * cardDetailView;

@end
