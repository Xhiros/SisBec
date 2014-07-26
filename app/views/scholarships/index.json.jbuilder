json.array!(@scholarships) do |scholarship|
  json.extract! scholarship, :id, :student_id, :starting, :ending
  json.url scholarship_url(scholarship, format: :json)
end
