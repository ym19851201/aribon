def calculate(n, *args)
  if n < 3
    return 0
  end

  sorted = args.flatten.sort.reverse

  (0..sorted.length).each do |i|
    lengthes = sorted[i..i+2]
    if lengthes.length < 3
      return 0
    end

    if triangle? lengthes
      return lengthes.inject :+
    end
  end
end

def triangle?(lengthes)
  lengthes[0] < lengthes[1] + lengthes[2]
end
