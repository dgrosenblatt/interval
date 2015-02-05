
def total(start, finish, diffs)
  sum = 0
  diffs[start..finish].each do |num|
    sum += num
  end
  sum
end

def generate_intervals(diffs)
  intervals = []
  diffs.length.times do |start|
    finish = start
    while finish < diffs.length
      intervals << {[start, finish] => total(start, finish, diffs)}
      finish += 1
    end
  end
  intervals
end

distances = [-2, 5, 5, 5, 10, 20, -1, -1, -1, 1]
print generate_intervals(distances).sort_by {|x| x.values.first }.last
