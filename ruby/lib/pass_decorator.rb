require_relative "item_decorator"

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
