class StringCalculator
    @called_count = 0

    def add(numbers)
        set_called_count
        return 0 if numbers.empty?
        validate_negatives(numbers)
        if numbers.start_with?("//")
            computed_str = numbers.split("\\n")
            delimiter = computed_str[0].gsub("//", "")
            numbers = computed_str[1]
            numbers=numbers.gsub(delimiter, ",")
        end
        numbers.gsub("\\n", ", ").split(",").sum(&:to_i)
    end


  class << self
    def get_called_count
      @called_count += 1
      @called_count
    end
  end


    private
    def validate_negatives(numbers)
        negatives = numbers.scan(/-\d+/)
        if !negatives.empty?
            raise "negatives not allowed #{negatives.join(',')}"
        end
    end

    def set_called_count
        self.class.get_called_count
    end
end