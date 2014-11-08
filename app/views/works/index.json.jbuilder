json.array!(@works) do |work|
  json.extract! work, :id, :start_date, :end_date, :client_id
  json.url work_url(work, format: :json)
end
