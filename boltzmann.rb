person_num = 25
coin_num = 10
status = Array.new(person_num, coin_num)

10000.times do
  from, to = (0..person_num - 1).to_a.shuffle[0, 2]
  status[from] -= 1
  status[to] += 1
end

result = status.sort.reverse

result.each do |i|
  puts "#{i}  #{"*" * (i / 5) if i > 0}"
end

# puts result
