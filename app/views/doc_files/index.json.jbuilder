json.array!(@doc_files) do |doc_file|
  json.extract! doc_file, :id, :name, :clarification, :docOwner, :student_id
  json.url doc_file_url(doc_file, format: :json)
end
