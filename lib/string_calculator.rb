class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        if numbers.start_with?("//")
            computed_str = numbers.split("\\n")
            delimiter = computed_str[0].gsub("//", "")
            numbers = computed_str[1]
            negative_num_scan = delimiter == '-' ? '--' : '-'
            if !numbers.scan(negative_num_scan).empty?
                raise 'negatives not allowed'
            end
            numbers=numbers.gsub(delimiter, ",")

        end
        numbers.gsub("\\n", ", ").split(",").sum(&:to_i)
    end
end