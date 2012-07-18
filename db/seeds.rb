User.create! do |user|
  user.full_name = 'Alan Middleton'
  user.email = 'alanmiddleton@yahoo.com'
  user.password = 'welcome'
  user.password_confirmation = 'welcome'

  user.full_name = 'Charles Martel'
  user.email = 'charelsmartel2008@hotmail.com'
  user.password = 'foobar'
  user.password_confirmation = 'foobar'
end

Category.create!(title: 'Football')
Category.create!(title: 'Huskers')
Category.create!(title: '2013')
Category.create!(title: 'Politics')
Category.create!(title: 'Hiking')
