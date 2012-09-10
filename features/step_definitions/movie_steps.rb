Then /I should see all of the movies/ do
  #account for header by subtracting 1 from count
  (page.all('table#movies tr').count - 1).should == Movie.all.count
end

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
   m = Movie.create movie
   m.save!
  end
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  one = (page.body =~ /#{Regexp.quote(e1)}/)
  two = (page.body =~ /#{Regexp.quote(e2)}/)
  one.should be < two
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    if uncheck
      uncheck "ratings_#{rating.strip}"
    else
      check "ratings_#{rating.strip}"
    end
  end
end
