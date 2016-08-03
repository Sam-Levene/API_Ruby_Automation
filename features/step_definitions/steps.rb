require "active_support/inflector"
require 'httparty'
$last_response = ""

Given(/^the client requests a list of (.*?)s?$/) do |type|
	$last_response = HTTParty.get('http://jsonplaceholder.typicode.com' + "/#{type.pluralize.downcase.tr(' ', '-')}")
end

Then(/^the response is a list containing (#{CAPTURE_INT}) (.*?)s?$/) do |count, type|
	data = MultiJson.load($last_response.body)
	validate_list(data, of: type, count: count)
end

Then(/^(#{CAPTURE_INT}) (.*?)s? ha(?:s|ve) the following attributes:$/) do |count, types, table|
	expected_item = table.hashes.each_with_object({}) do |row, hash|
	    name, value, type = row["attribute"], row["value"], row["type"]
	    hash[name.tr(" ", "_").camelize(:lower)] = value.to_type(type.constantize)
	end
	data = MultiJson.load($last_response.body)
	matched_items = data.select { |item| item == expected_item }
	expect(matched_items.count).to eq(count)
end