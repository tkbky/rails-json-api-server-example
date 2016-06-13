if Post.count == 0
  365.times { |i| Post.create!(title: "#{Date.today + i.day}", body: "Today is #{(Date.today + i.day).strftime('%A')}")}
end

if User.count == 0
  User.create!(email: 'user@example.com', password: '123123123', password_confirmation: '123123123')
end
