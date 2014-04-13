//
//  WeiboCell.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "WeiboCell.h"
#import "User.h"

// 引用 分类 概念


#import "UIImageView+AFNetworking.h"

@implementation WeiboCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _userImageView =[[UIImageView alloc]init];
        _userImageView.frame = CGRectMake(8, 8, 44, 44);
        [self.contentView addSubview:_userImageView];
        
        _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 8, 100, 24)];
        [self.contentView addSubview:_userNameLabel];
        
        _weiboTextLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 36, 200, 60)];
        [self.contentView addSubview:_weiboTextLabel];
        _weiboTextLabel.font = [UIFont systemFontOfSize:18];
        _weiboTextLabel.numberOfLines = 0;
        
        
    }
    return self;
}

+(CGFloat)cellHeight:(Status *)status{
    
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName,nil];
  CGSize size=  [status.text boundingRectWithSize:CGSizeMake(200, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    
    return size.height;
}

-(void)setStatus:(Status *)status{
    _weiboTextLabel.text = status.text;
    
    [_weiboTextLabel sizeToFit];
    
    _userNameLabel.text = status.user.screenName;
    
    [_userImageView setImageWithURL:[NSURL URLWithString:status.user.imageUrl]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
