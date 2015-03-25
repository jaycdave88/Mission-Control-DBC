module ApplicationHelper
  def phase_color sticky
    phase = sticky.user.phase

    if phase == "1"
      "yellow"
    elsif phase == "2"
      "pink"
    elsif phase == "3"
      "purple"
    else
      "orange"
    end      
  end
end
