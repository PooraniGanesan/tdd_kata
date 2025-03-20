class StringCalculator
    @called_count = 0

    def add(numbers)
        set_called_count
        return 0 if numbers.empty?
        validate_negatives(numbers)
        if numbers.start_with?("//")
            computed_str = numbers.split("\\n")
            delimiters = computed_str[0].scan(/\[(.*?)\]/).flatten
            if delimiters.empty?
                numbers = computed_str[1].gsub(computed_str[0][2], ",")
            else
                numbers = replace_delimiters(computed_str[1], delimiters)
            end
        end
        numbers.gsub("\\n", ", ").split(",").map(&:to_i).reject{|x| x >1000}.sum
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

    def replace_delimiters(numbers, delimiters)
        delimiters.each do |de|
            numbers.gsub!(de, ",")
        end
       numbers
    end

    def set_called_count
        self.class.get_called_count
    end
end