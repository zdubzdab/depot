module PersonsHelper
  def new_orders (array)
    array2 = []
    array.each do |i|
      array2 << (i.status)
    end

    array2.count { |i| i == "new"}
  end
end

