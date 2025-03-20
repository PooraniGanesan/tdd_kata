class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        numbers.gsub("\\n", ", ").split(",").sum(&:to_i)
    end
end