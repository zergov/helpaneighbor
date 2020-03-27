module ApplicationHelper
  SECURITY_QUESTIONS = [
    "What was your childhood nickname?",
    "In what city did you meet your spouse/significant other?",
    "What is the name of your favorite childhood friend?",
    "What street did you live on in third grade?",
    "What is your oldest sibling’s birthday month and year? (e.g., January 1900)",
    "What is the middle name of your youngest child?",
    "What is your oldest sibling's middle name?",
    "What school did you attend for sixth grade?",
    "What was your childhood phone number including area code? (e.g., 000-000-0000)",
    "What is your oldest cousin's first and last name?",
    "What was the name of your first stuffed animal?",
    "In what city or town did your mother and father meet?",
    "Where were you when you had your first kiss?",
    "What is the first name of the boy or girl that you first kissed?",
    "What was the last name of your third grade teacher?",
    "In what city does your nearest sibling live?",
    "What is your youngest brother’s birthday month and year? (e.g., January 1900)",
    "What is your maternal grandmother's maiden name?",
    "In what city or town was your first job?",
    "What is the name of the place your wedding reception was held?",
    "What is the name of a college you applied to but didn't attend?",
    "Where were you when you first heard about 9/11?",
  ].freeze

  def error_message_for(model, field)
    if model.errors.messages[field].any?
      "<div class='input-error-message'>#{model.errors.messages[field].first}</div>".html_safe
    else
      ""
    end
  end

  def security_questions
    SECURITY_QUESTIONS
  end
end
