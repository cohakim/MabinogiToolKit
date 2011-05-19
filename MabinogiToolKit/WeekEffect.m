
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
          @"クリティカルヒットの発生率が高くなります。", 
          @"ラッキーフィニッシュの発生率が高くなります。",
          @"演奏成功率が増加します。",
          @"魔法音楽の成功率が増加します。",
          @"魔法音楽の発生率が増加します。",
          nil];
}
+ (NSArray*)effectsAlbanEiler {
  return [NSArray arrayWithObjects:
          @"生産スキルの成功率が高くなります。", 
          @"生活スキルのランクアップボーナスが増加します。",
          @"生産品の品質が向上します。",
          nil];
}
+ (NSArray*)effectsBeltane {
  return [NSArray arrayWithObjects:
          @"同じアイテムを落とした場合でもダンジョンの形が変わるようになります。", 
          @"ダンジョンでアイテムが出る確率が高くなります。",
          @"戦闘スキルのランクアップボーナスが増加します。",
          nil];
}
+ (NSArray*)effectsAlbanHeruin {
  return [NSArray arrayWithObjects:
          @"自然や動物からアイテムを入手できる確率が高くなります。", 
          @"店から物を安く買うことができます。",
          @"銀行の手数料が安くなります。",
          @"スキルのパーフェクト・トレーニングボーナスが増加します。",
          nil];
}
+ (NSArray*)effectsLughnasadh {
  return [NSArray arrayWithObjects:
          @"エンチャントの成功率が高くなります。", 
          @"魔法スキルのランクアップボーナスが増加します。",
          @"装備を使用したときに得る熟練度が増加します。",
          nil];
}
+ (NSArray*)effectsAlbanElved {
  return [NSArray arrayWithObjects:
          @"行動不能時の経験値ペナルティーが減ります。", 
          @"ポーションの効果が高くなります。(回復量1.5倍)",
          @"アルバイトの報酬が高くなります。",
          nil];
}
+ (NSArray*)effectsSamhain {
  return [NSArray arrayWithObjects:
          @"歳を取ることでAPを獲得します。", 
          @"食べ物の効果が高くなります。",
          @"少し動いてしまった動物もスケッチできます。",
          @"錬金術スキルの成功率が高くなります。",
          nil];
}

+ (NSArray*)itemsImbolic {
  return [NSArray arrayWithObjects:
          @"染色アンプル",
          @"金属染色アンプル",
          nil];
}
+ (NSArray*)itemsAlbanEiler {
  return [NSArray arrayWithObjects:
          @"完全回復ポーション",
          @"生命力のエリクサー",
          @"マナのエリクサー",
          @"スタミナのエリクサー",
          nil];
}
+ (NSArray*)itemsBeltane {
  return [NSArray arrayWithObjects:
          @"パーティー用フェニックスの羽根×2",
          @"遠隔武器屋利用チケット×2",
          @"遠隔衣類修理チケット×2",
          @"有効期間1日延長の鍵×1",
          nil];
}
+ (NSArray*)itemsAlbanHeruin {
  return [NSArray arrayWithObjects:
          @"採集速度増加ポーション",
          @"キャンプキット",
          @"遠隔鍛冶屋修理チケット×2",
          @"遠隔錬金術師の家チケット×1",
          nil];
}
+ (NSArray*)itemsLughnasadh {
  return [NSArray arrayWithObjects:
          @"キャンプファイアキット×2",
          @"遠隔官庁利用チケット×2",
          @"銀行チケット×2 ",
          nil];
}
+ (NSArray*)itemsAlbanElved {
  return [NSArray arrayWithObjects:
          @"蜜蝋の翼×2",
          @"ダンジョン蜜蝋の翼×2",
          @"友達召喚カプセル×2",
          nil];
}
+ (NSArray*)itemsSamhain {
  return [NSArray arrayWithObjects:
          @"スキルアントレインカプセル",
          @"ヒーラーチケット×2",
          @"遠隔魔法武器修理チケット×2",
          nil];
}


@end
