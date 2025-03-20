class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        negatives = numbers.scan(/-\d+/)
        if !negatives.empty?
            raise "negatives not allowed #{negatives.join(',')}"
        end
        if numbers.start_with?("//")
            computed_str = numbers.split("\\n")
            delimiter = computed_str[0].gsub("//", "")
            numbers = computed_str[1]
            numbers=numbers.gsub(delimiter, ",")
        end
        numbers.gsub("\\n", ", ").split(",").sum(&:to_i)
    end
end