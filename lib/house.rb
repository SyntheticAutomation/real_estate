class House

  attr_reader :price, :address, :rooms, :area

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.select do |x|
      x.category == category
      end
  end

  def area
    room_areas = @rooms.map do |x|
      x.area
    end
    room_areas.sum
  end

  def price_per_square_foot
    return (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area #descending
    sorted_rooms = @rooms.sort_by do |x|
      x.area
    end
    sorted_rooms.reverse
  end

  def rooms_by_category
    organized_rooms = {}
    #@rooms = [room_1, room_2, room_3, room_4]
    @rooms.map do |x|
      if organized_rooms.include?(x.category)
        organized_rooms[x.category] << x
      else
        organized_rooms[x.category] = [x]
      end
    end
    sorted_categories = organized_rooms.sort_by do |x|
      x.count
    end
    [sorted_categories.to_h]
  end

end
