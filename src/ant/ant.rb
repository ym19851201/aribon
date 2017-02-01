def min_max(length, ants)
  candidates = [ants, ants.map {|ant| length - ant}].transpose
  min = candidates.map {|e| e.min}.max
  max = candidates.map {|e| e.max}.max
  return min, max
end

