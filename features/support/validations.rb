def validate_list(data, of: nil, count: nil)
  expect(data).to be_a_kind_of(Array)
  expect(data.count).to eq(count) unless count.nil?
  unless of.nil?
    validate_item = "validate_#{of.singularize.downcase.tr(' ', '_')}".to_sym
    data.each { |item| send(validate_item, item) }
  end
end

def validate_post(data)
  expect(data["userId"]).to be_a_kind_of(Integer)
  expect(data["userId"]).not_to eq(0)
  expect(data["id"]).to be_a_kind_of(Integer)
  expect(data["id"]).not_to eq(0)
  expect(data["title"]).to be_a_kind_of(String)
  expect(data["title"]).to_not be_empty
  expect(data["body"]).to be_a_kind_of(String)
  expect(data["body"]).to_not be_empty
end