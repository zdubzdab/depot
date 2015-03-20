module PersonsHelper
  def new_orders (array)
    array2 = []
    array3 = []
    array.each do |i|
      array2.push(i.status)
    end
      array2.each do |i|
        if i == "new"
          array3.push(i)
        else
        end
      end

      if array3.empty?
        0
      else
        array3.count
      end
  end
end
