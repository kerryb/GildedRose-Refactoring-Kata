class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        BrieDecorator.new(item).update
      when "Backstage passes to a TAFKAL80ETC concert"
        update_pass(item)
      when "Sulfuras, Hand of Ragnaros"
        update_legendary(item)
      else
        update_normal(item)
      end
    end
  end

  private

  def update_pass(item)
    if item.quality < 50
      item.quality = item.quality + 1
      if item.sell_in < 11
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
      if item.sell_in < 6
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0
      item.quality = 0
    end
  end

  def update_legendary(item)
  end

  def update_normal(item)
    if item.quality > 0
      item.quality = item.quality - 1
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0
      if item.quality > 0
        item.quality = item.quality - 1
      end
    end
  end
end

class BrieDecorator
  def initialize(item)
    @item = item
  end

  def update
    if @item.quality < 50
      @item.quality = @item.quality + 1
    end
    @item.sell_in = @item.sell_in - 1
    if @item.sell_in < 0
      if @item.quality < 50
        @item.quality = @item.quality + 1
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
