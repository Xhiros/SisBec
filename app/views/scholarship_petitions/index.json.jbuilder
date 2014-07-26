json.array!(@scholarship_petitions) do |scholarship_petition|
  json.extract! scholarship_petition, :id, :student_id, :scholarship_id, :approved
  json.url scholarship_petition_url(scholarship_petition, format: :json)
end
