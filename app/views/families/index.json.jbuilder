json.array!(@families) do |family|
  json.extract! family, :id, :name, :dni, :relationship, :student_id
  json.url family_url(family, format: :json)
end
