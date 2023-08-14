#!/usr/env/bin ruby


# Usage:
#     diff <(ruby ./golden_master.rb) original_gm_output

require_relative "lib/gilded_rose"

names = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros", "Something normal"]
sell_ins = 0..20
qualities = 0..20

items = names.flat_map {|name|
  sell_ins.flat_map {|sell_in|
    qualities.flat_map {|quality|
      Item.new(name, sell_in, quality)
    }
  }
}

gilded_rose = GildedRose.new(items)

(1..30).each {|iteration|
  gilded_rose.update_quality
  gilded_rose.items.each {|item| puts "#{iteration}: #{item}" }
}
