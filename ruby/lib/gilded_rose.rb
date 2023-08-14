require_relative "item_decorator"
require_relative "brie_decorator"
require_relative "pass_decorator"
require_relative "normal_decorator"

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      decorate(item).update
    end
  end

  private
  def decorate(item)
    cls = case item.name
          when "Aged Brie" then BrieDecorator
          when "Backstage passes to a TAFKAL80ETC concert" then PassDecorator
          when "Sulfuras, Hand of Ragnaros" then ItemDecorator
          else NormalDecorator
          end
    cls.new(item)
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
