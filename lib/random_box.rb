# require "random_box/version"

module RandomBox
  class Box
    attr_reader :contents_data, :history

    def initialize(seed = [])
      @contents = convert_to_array(seed).map(&:to_sym)
      @history = []
      update_contents_data
    end

    def draw(num = 1, back: false)
      raise "There is no contents in this box" if @contents.empty?
      if back
        draw_items = num.times.map{@contents.sample}
      else
        draw_items = num.times.map { @contents.delete_at(rand(@contents.size)) }
        update_contents_data
      end
      @history += draw_items
      draw_items
    end

    def add(items)
      @contents += convert_to_array(items).map(&:to_sym)
      update_contents_data
    end

    def show_table
      header = justify_row(%w(Item Number Percent))
      puts header
      puts "-" * header.length
      @contents_data.each do |item, data|
        row = [item, *data.values]
        puts justify_row(row)
      end
      nil
    end

    private

    def convert_to_array(items)
      case items
      when Array
        items
      when Range
        items.to_a
      when Hash
        items.flat_map{|item, num| Array.new(num, item)}
      else
        raise TypeError, "Please give Array or Range or Hash object to argument"
      end
    end

    def update_contents_data
      total_size = @contents.size
      @contents_data = @contents
        .inject(Hash.new(0)) { |count, item| count[item] += 1; count}
        .sort_by{|_, num| -num}
        .to_h
        .transform_values{ |num|
          percent = num.fdiv(total_size) * 100
          {number: num, percent: percent.round(4)}
        }
    end

    def justify_row(row)
      row.map{|h| h.to_s.rjust(10)}.join(" ")
    end
  end
end
