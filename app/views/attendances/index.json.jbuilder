json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :date, :labour_id, :work_id, :hours, :in, :out
  json.url attendance_url(attendance, format: :json)
end
