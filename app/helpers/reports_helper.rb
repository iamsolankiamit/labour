module ReportsHelper
  def to_presenty_symbol(hours)
    case hours
    when 0
      return "A"
    when 2
      return "'"
    when 4
      return "''"
    when 6
      return "'''"
    when 8
      return "p"
    when 10
      return "p'"
    when 12
      return "p''"
    when 14
      return "p'''"
    when 16
      return "pp"
    when 18
      return "pp'"
    when 20
      return "pp''"
    when 22
      return "pp'''"
    when 24
      return "ppp"
    end
  end
end
