//
//  MusicInfoViewStyle4.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/10.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicInfoViewStyle4.h"
#import "MusicRoomInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

@implementation MusicInfoViewStyle4
{
    NSTimer *timer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _logo = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, CGRectGetWidth(frame)-12, CGRectGetWidth(frame)-12)];
        [[_logo layer] setCornerRadius:(CGRectGetWidth(frame) - 12.0f) * 0.5f];
        [[_logo layer] setMasksToBounds:YES];
        _progress = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetWidth(frame))];
        [_progress setImage:[UIImage imageNamed:@"progress_line.png"]];
        [self addSubview:_logo];
        [self addSubview:_progress];
        
        //[self updateRadius];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selfClicked:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)updateRadius {
    [[_logo layer] setCornerRadius:(CGRectGetWidth(self.frame) - 12.0f) * 0.5f];
    [[_logo layer] setMasksToBounds:YES];
    // TODO:特殊处理进度条，如果是小logo，采用小号progressline
}

- (void)selfClicked:(UIGestureRecognizer *)gesture {
    if ([_delegate respondsToSelector:@selector(MusicInfoViewStyle4Clicked)]) {
        [_delegate MusicInfoViewStyle4Clicked];
    }
}

- (void)pauseTimer:(BOOL)pause {
    if (pause) {
        [timer setFireDate:[NSDate distantFuture]];
    }
    else {
        [timer setFireDate:[NSDate date]];
    }
}

- (void)setData:(id)data {
    if (timer == nil) {
        // 这个timer只负责封面自己旋转，进度条的显示由外部控制
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateDiskFrame) userInfo:nil repeats:YES];
        [timer fire];
    }
    [_logo setImageWithStrURL:[BaseInfoAdapter getPic:data]];
}

- (void)updateDiskFrame {
    static CGFloat rate = 0.01;
    _logo.transform = CGAffineTransformRotate(_logo.transform, ROTATION_ANGLE);
    rate += ROTATION_ANGLE/10.0;
}

- (void)updateProcessLine:(CGFloat)rate {
    rate = rate < 0.0 ? 0.0 : rate;
    rate = rate > 1.0 ? 0.0 : rate;
    CGFloat width = CGRectGetWidth([_progress frame]);
    UIImage *processLine = [UIImage imageNamed:@"progress_line.png"];
    UIImage *processMask = [self getCircleProcessImageWithNoneAlpha:CGSizeMake(width, width) progress:rate];
    UIImage *currentProcessImage = [self maskImage:processLine withImage:processMask];
    [_progress setImage:currentProcessImage];
}

//制作图片遮罩(注意：需要有一张原图是带alpha通道的图片，和一个不带alpha通道的遮罩图)
-(UIImage *)maskImage:(UIImage *)baseImage withImage:(UIImage *)theMaskImage{
    
    UIGraphicsBeginImageContext(baseImage.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, baseImage.size.width, baseImage.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGImageRef maskRef = theMaskImage.CGImage;
    CGImageRef maskImage = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                             CGImageGetHeight(maskRef),
                                             CGImageGetBitsPerComponent(maskRef),
                                             CGImageGetBitsPerPixel(maskRef),
                                             CGImageGetBytesPerRow(maskRef),
                                             CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([baseImage CGImage], maskImage);
    CGImageRelease(maskImage);//避免泄漏
    CGContextDrawImage(ctx, area, masked);
    CGImageRelease(masked);//避免泄漏
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}

//获取不含有alpha通道的扇形进度圆圈
-(UIImage *)getCircleProcessImageWithNoneAlpha:(CGSize)imageSize progress:(float)progress{
    
    float width = imageSize.width;
    float height = imageSize.height;
    
    //圆心
    CGPoint centerPoint = CGPointMake(height / 2, width / 2);
    //半径
    CGFloat radius = MIN(height, width) / 2;
    //扇形开始角度
    CGFloat radians = DEGREES_2_RADIANS((360-progress*359.9)-270);
    
    //申请内存空间
    GLubyte * spriteData = (GLubyte *) calloc(width * height, sizeof(GLubyte));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapContext = CGBitmapContextCreate(spriteData, width, height, 8, width, colorSpace, kCGImageAlphaNone);
    CGContextSetFillColorSpace(bitmapContext, colorSpace);
    
    //绘制全部底色
    CGRect rectAll = CGRectMake(0, 0, width, height);
    CGContextSetFillColorWithColor(bitmapContext, [UIColor blackColor].CGColor);
    CGContextFillRect(bitmapContext, rectAll);
    
    CGContextSetFillColorWithColor(bitmapContext, [UIColor whiteColor].CGColor);
    CGContextMoveToPoint(bitmapContext, centerPoint.x, centerPoint.y);
    CGContextAddArc(bitmapContext, centerPoint.x, centerPoint.y, radius, DEGREES_2_RADIANS(90), radians, 0);
    CGContextClosePath(bitmapContext);
    CGContextFillPath(bitmapContext);
    
    CGImageRef processImageRef = CGBitmapContextCreateImage(bitmapContext);
    UIImage *processImage = [UIImage imageWithCGImage:processImageRef];
    
    CGImageRelease(processImageRef);
    CGContextRelease(bitmapContext);
    CGColorSpaceRelease(colorSpace);
    free(spriteData);
    
    return processImage;
}

@end
