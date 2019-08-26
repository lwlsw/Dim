#import "Dim.h"

@implementation Dim

- (id)init  {
    if (self = [super init]) {
        CFPreferencesAppSynchronize(CFSTR("com.thomasfinch.dim"));
        BOOL enabled = !CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.thomasfinch.dim")) ? YES : [CFBridgingRelease(CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.thomasfinch.dim"))) boolValue];
        _selected = enabled;
        
    }
    return self;
}

//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [UIImage imageNamed:@"Dim" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the color selection color of your module here
- (UIColor *)selectedColor
{
	return [UIColor blueColor];
}

- (BOOL)isSelected
{
  return _selected;
}

- (void)setSelected:(BOOL)selected
{
	_selected = selected;

  [super refreshState];

  if(_selected)
  {
    //Your module got selected, do something
      [[NSClassFromString(@"DimController") sharedInstance] setEnabled:YES];
  }
  else
  {
    //Your module got unselected, do something
      [[NSClassFromString(@"DimController") sharedInstance] setEnabled:NO];
  }
}

@end
