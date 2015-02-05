def greatest_interval(observations)
  generate_intervals(observations).sort_by {|x| -x.values.first }.first
end

def total(start, finish, diffs)
  sum = 0
  diffs[start..finish].each do |num|
    sum += num
  end
  sum
end

def generate_intervals(observations)
  intervals = []
  diffs = distances(observations)
  diffs.length.times do |start|
    finish = start
    while finish < diffs.length
      intervals << {[start, finish] => total(start, finish, diffs)}
      finish += 1
    end
  end
  intervals
end

def distances(observations)
  observations.map { |x| x[1] - x[0]}
end


observations = [[5, 3], [5, 10], [5, 10], [5, 10], [5, 15], [15, 35], [8, 7],
                [1, 0], [5, 4], [5, 4]]

print greatest_interval(observations)
