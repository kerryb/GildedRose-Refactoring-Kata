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

class ItemDecorator
  def initialize(item)
    @item = item
  end

  def update
  end

  private

  MAX_QUALITY = 50

  def increase_quality
    if @item.quality < MAX_QUALITY
      @item.quality = @item.quality + 1
    end
  end
end

class BrieDecorator < ItemDecorator
  def update
    increase_quality
    @item.sell_in = @item.sell_in - 1
    if @item.sell_in < 0
      increase_quality
    end
  end
end

class PassDecorator < ItemDecorator
  def update
    increase_quality
    if @item.sell_in < 11
      increase_quality
    end
    if @item.sell_in < 6
      increase_quality
    end
    @item.sell_in = @item.sell_in - 1
    if @item.sell_in < 0
      @item.quality = 0
    end
  end
end

class NormalDecorator < ItemDecorator
  def update
    if @item.quality > 0
      @item.quality = @item.quality - 1
    end
    @item.sell_in = @item.sell_in - 1
    if @item.sell_in < 0
      if @item.quality > 0
        @item.quality = @item.quality - 1
      end
    end
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
