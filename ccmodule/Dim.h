#import <ControlCenterUIKit/CCUIToggleModule.h>

@interface Dim : CCUIToggleModule
{
  BOOL _selected;
}

@end

@interface DimController : NSObject

@property (nonatomic) BOOL enabled;
@property (nonatomic) float brightness;
+ (DimController*)sharedInstance;
- (void)updateFromPreferences;
- (void)showControlPanel;
- (void)setEnabled:(BOOL)e;
@end
