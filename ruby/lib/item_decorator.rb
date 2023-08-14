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
      @item.quality += 1
    end
  end

  def decrease_quality
    if @item.quality > 0
      @item.quality -= 1
    end
  end
end
