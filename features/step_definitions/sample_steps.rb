When(/^Yahooにアクセスすると$/) do
  visit 'http://www.yahoo.co.jp'
end

Then(/^ニュースがある$/) do
  page.find(:id, 'topics').should have_content('ニュース')
end