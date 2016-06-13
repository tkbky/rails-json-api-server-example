if Post.count == 0
  365.times { |i| Post.create!(title: "#{Date.today + i.day}", body: "Today is #{(Date.today + i.day).strftime('%A')}")}
end
