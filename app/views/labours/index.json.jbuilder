json.array!(@labours) do |labour|
  json.extract! labour, :id, :first_name, :last_name, :phone_no, :date_of_joining, :salary_per_day, :salary_for_hours, :on_vacation, :has_left
  json.url labour_url(labour, format: :json)
end
