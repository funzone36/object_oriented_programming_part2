class Item

  attr_accessor :name, :price, :quantity

  def initialize(item, imported)
    if item.split(" at ")[0].split(" ").length == 2
      @name = item.split(" at ")[0].split(" ")[1]
    elsif item.split(" at ")[0].split(" ").length == 3
      @name = item.split(" at ")[0].split(" ")[1] + " " + item.split(" at ")[0].split(" ")[2]
    elsif item.split(" at ")[0].split(" ").length == 4
      @name = item.split(" at ")[0].split(" ")[1] + " " + item.split(" at ")[0].split(" ")[2] + " " + item.split(" at ")[0].split(" ")[3]
    else
      @name = item.split(" at ")[0].split(" ")[1] + " " + item.split(" at ")[0].split(" ")[2] + " " + item.split(" at ")[0].split(" ")[3] + " "
      + item.split(" at ")[0].split(" ")[4]
    end
    @price = item.split(" at ")[1].to_f
    @quantity = item.split(" at ")[0].split(" ")[0].to_i
    @imported = imported
    calculatetax
  end

  def calculatetax
      if @imported == 1
        if ["chocolate", "book", "pills"].include?(@name)
          @salestax = @price * 0.10
        else
          @salestax = @price * 0.15
        end
      else
        if ["chocolate", "book", "pills"].include?(@name)
          @salestax = 0
        else
          @salestax = @price * 0.05
        end
      end
      return @salestax
  end

  def description
    "#{@quantity} #{@name}: "
  end

  def total_price
    @price + @salestax
  end

end

class Receipt

  def initialize
    @items = []
    @salestax = 0
    @price = 0
    @total = 0
  end

  def sum(item)
    @items.each do |item|
      @total += item.total_price
    end
    return @total
  end

  def add_item
    puts "Is the item imported? Y/N"
    answer = gets.chomp
    if answer == "Y"
      imported = 1
    else
      imported = 0
    end
    puts "What are your items and prices? Type exit to checkout."
    loop do
      item = gets.chomp
      break if item == "exit"
      @items << Item.new(item, imported)
    end
  end

  def report
    add_item
    @items.each do |item|
      puts item.description + item.total_price.to_s
    end
    puts sum(@items)
  end

end

jason = Receipt.new
jason.report
