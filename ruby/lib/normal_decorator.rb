require_relative "gilded_rose"

class NormalDecorator < ItemDecorator
  def update
    decrease_quality
    @item.sell_in = @item.sell_in - 1
    if @item.sell_in < 0
      decrease_quality
    end
  end
end
