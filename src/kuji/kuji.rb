def equal?(m, k)
  k.repeated_combination(4).any? {|e| e.inject(:+) == m}
end

