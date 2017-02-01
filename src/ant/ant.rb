def min_max(length, ants)
  candidates = ants.zip ants.map {|ant| length - ant}
  min = candidates.map {|e| e.min}.max
  max = candidates.map {|e| e.max}.max
  return min, max
end

