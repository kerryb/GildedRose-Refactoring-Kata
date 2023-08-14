require_relative "item_decorator"

class BrieDecorator < ItemDecorator
  def update
    increase_quality
    @item.sell_in = @item.sell_in - 1
    if @item.sell_in < 0
      increase_quality
    end
  end
end
