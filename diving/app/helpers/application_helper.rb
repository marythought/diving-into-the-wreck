module ApplicationHelper
  def affirmative?(choice)
    affirmative = ["yes", "y", "yup", "ok", "heck yeah", "i guess", "hell yeah"]
    affirmative.include? choice
  end
end
