#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ICContainerView.h"
#import "ICPagingManager.h"
#import "ICPagingManagerProtocol.h"
#import "ICSegmentBar.h"
#import "ICSegmentBarConfig.h"
#import "ICSystemSegmentedControl.h"
#import "ISegmentBar.h"
#import "SegmentControl.h"
#import "SegmentFactory.h"
#import "UIView+ICFrame.h"

FOUNDATION_EXPORT double ICPagingManagerVersionNumber;
FOUNDATION_EXPORT const unsigned char ICPagingManagerVersionString[];

