
#import "WeekEffect.h"

@interface WeekEffect ()
+ (NSArray*)effectsImbolic;
+ (NSArray*)effectsAlbanEiler;
+ (NSArray*)effectsBeltane;
+ (NSArray*)effectsAlbanHeruin;
+ (NSArray*)effectsLughnasadh;
+ (NSArray*)effectsAlbanElved;
+ (NSArray*)effectsSamhain;
+ (NSArray*)itemsImbolic;
+ (NSArray*)itemsAlbanEiler;
+ (NSArray*)itemsBeltane;
+ (NSArray*)itemsAlbanHeruin;
+ (NSArray*)itemsLughnasadh;
+ (NSArray*)itemsAlbanElved;
+ (NSArray*)itemsSamhain;
@end

@implementation WeekEffect

#pragma mark -
#pragma mark Public Methods

+ (NSArray*)effectsFor:(ErinnWeek)week {
  NSArray *effects;
  switch (week) {
    case ErinnWeekImbolic:
      effects = self.effectsImbolic;
      break;
    case ErinnWeekAlbanEiler:
      effects = self.effectsAlbanEiler;
      break;
    case ErinnWeekBeltane:
      effects = self.effectsBeltane;
      break;
    case ErinnWeekLughnasadh:
      effects = self.effectsLughnasadh;
      break;
    case ErinnWeekAlbanHeruin:
      effects = self.effectsAlbanHeruin;
      break;
    case ErinnWeekAlbanElved:
      effects = self.effectsAlbanElved;
      break;
    case ErinnWeekSamhain:
      effects = self.effectsSamhain;
      break;
  }
  return effects;
}

+ (NSArray*)itemsFor:(ErinnWeek)week {
  NSArray *s;
  switch (week) {
    case ErinnWeekImbolic:
      s = self.itemsImbolic;
      break;
    case ErinnWeekAlbanEiler:
      s = self.itemsAlbanEiler;
      break;
    case ErinnWeekBeltane:
      s = self.itemsBeltane;
      break;
    case ErinnWeekLughnasadh:
      s = self.itemsLughnasadh;
      break;
    case ErinnWeekAlbanHeruin:
      s = self.itemsAlbanHeruin;
      break;
    case ErinnWeekAlbanElved:
      s = self.itemsAlbanElved;
      break;
    case ErinnWeekSamhain:
      s = self.itemsSamhain;
      break;
  }
  return s;
}

#pragma mark -
#pragma mark Private Methods

+ (NSArray*)effectsImbolic {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Increase in critical hit rate.", nil), 
          NSLocalizedString(@"Increase in lucky finish.", nil),
          NSLocalizedString(@"Increase in success rate for instrument playing.", nil),
          NSLocalizedString(@"Increase in success rate for magic music.", nil),
          NSLocalizedString(@"Increase in taming rate using magic music.", nil),
          nil];
}
+ (NSArray*)effectsAlbanEiler {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Increase in success rate for production skills.", nil), 
          NSLocalizedString(@"Increase in rank up bonus for life skills.", nil),
          NSLocalizedString(@"Increase in quality of output for productions.", nil),
          nil];
}
+ (NSArray*)effectsBeltane {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Dungeon maps change even if the same item is dropped.", nil), 
          NSLocalizedString(@"Increase in dungeon item drop rate.", nil),
          NSLocalizedString(@"Increase in rank-up bonus for Combat skills.", nil),
          nil];
}
+ (NSArray*)effectsAlbanHeruin {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Increase in item drop rate from animals and nature.", nil), 
          NSLocalizedString(@"Decrease in prices for items in NPC shops.", nil),
          NSLocalizedString(@"Decrease in Bank transaction fees.", nil),
          NSLocalizedString(@"Increase in rank-up bonus for complete mastery of a skill.", nil),
          nil];
}
+ (NSArray*)effectsLughnasadh {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Enchant success rates are increased.", nil), 
          NSLocalizedString(@"Increase in rank-up bonus for Magic skills.", nil),
          NSLocalizedString(@"Increase of proficiency gaining rate.", nil),
          nil];
}
+ (NSArray*)effectsAlbanElved {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Decrease in penalties if knocked unconscious. ", nil), 
          NSLocalizedString(@"All potions become more potent.", nil),
          NSLocalizedString(@"Increase in rewards for completing part-time jobs.", nil),
          nil];
}
+ (NSArray*)effectsSamhain {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"As you age and grow, you will obtain AP", nil), 
          NSLocalizedString(@"Food effects are increased.", nil),
          NSLocalizedString(@"You will be able to even sketch monsters that move slightly.", nil),
          NSLocalizedString(@"The L-Rod's effect will increase over time.", nil),
          NSLocalizedString(@"Increase in success rates for Alchemy skills.", nil),
          nil];
}

+ (NSArray*)itemsImbolic {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Dye Ampoule", nil),
          NSLocalizedString(@"Metal Dye Ampoule", nil),
          nil];
}
+ (NSArray*)itemsAlbanEiler {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Full Recovery Potion", nil),
          NSLocalizedString(@"HP Elixir", nil),
          NSLocalizedString(@"MP Elixir", nil),
          NSLocalizedString(@"Stamina Elixir", nil),
          nil];
}
+ (NSArray*)itemsBeltane {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Party Phoenix Feather ×2", nil),
          NSLocalizedString(@"Remote Weapon Shop Ticket ×2", nil),
          NSLocalizedString(@"Remote Tailor Coupon ×2", nil),
          NSLocalizedString(@"1 Day Expiration Extension Key ×1", nil),
          nil];
}
+ (NSArray*)itemsAlbanHeruin {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"High Gathering Speed Potion", nil),
          NSLocalizedString(@"Camp Kit", nil),
          NSLocalizedString(@"Remote Blacksmith Coupon ×2", nil),
          NSLocalizedString(@"Remote Alchemist Coupon ×1", nil),
          nil];
}
+ (NSArray*)itemsLughnasadh {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Campfire Kit ×2", nil),
          NSLocalizedString(@"Remote Administrative Office Ticket ×2", nil),
          NSLocalizedString(@"Remote Bank Coupon ×2", nil),
          nil];
}
+ (NSArray*)itemsAlbanElved {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Waxen Wing of Goddess ×2", nil),
          NSLocalizedString(@"Dungeon Wax Wings ×2", nil),
          NSLocalizedString(@"Friend Summons Capsule ×2", nil),
          nil];
}
+ (NSArray*)itemsSamhain {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Skill Reset Capsule", nil),
          NSLocalizedString(@"Remote Healer Coupon ×2", nil),
          NSLocalizedString(@"Remote Magic Weapon Blacksmith Coupon ×2", nil),
          nil];
}

@end
