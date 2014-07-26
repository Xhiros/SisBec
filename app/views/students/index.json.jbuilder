json.array!(@students) do |student|
  json.extract! student, :id, :firstName, :lastName, :dni, :career, :otherCareer, :fileNumber, :address, :department, :telephone, :cellphone, :dwelling, :rental, :economicSituation, :children, :dependent, :schoolDays, :familyGroup, :income, :minors, :disabilityOrIllness, :clarifications, :vehicles, :card_id
  json.url student_url(student, format: :json)
end
