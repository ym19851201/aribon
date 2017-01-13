def calculate(n, *args)
  if n < 3
    return 0
  end

  sorted = args.flatten.sort.reverse

  (0..(sorted.length - 3)).each do |i|
    lengthes = sorted[i..i+2]
    if triangle? lengthes
      return lengthes.inject :+
    end
  end
  return 0
end

def triangle?(lengthes)
  lengthes[0] < lengthes[1] + lengthes[2]
end

