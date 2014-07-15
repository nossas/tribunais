def to_url string
  return root_path if string == "the homepage"
  return root_path(anchor: "share") if string == "the share page"
  raise "I don't know the url '#{string}'"
end

def to_field string
  return "first_name" if string == "the first name field"
  return "last_name" if string == "the last name field"
  return "email" if string == "the email field"
  raise "I don't know '#{string}'"
end

def to_element string
  return ".slide-1" if string == "the first slide of content"
  return ".slide-2" if string == "the second slide of content"
  return ".slide-3" if string == "the third slide of content"
  return ".facebook-share" if string == "the Facebook share button"
  return ".twitter-share" if string == "the Twitter share button"
  return "#share" if string == "the share reveal"
  return "form.new_poke" if string == "the poke form"
  return ".first_name_field.error" if string == "the first name field with error"
  return ".last_name_field.error" if string == "the last name field with error"
  return ".email_field.error" if string == "the email field with error"
  raise "I don't know the element '#{string}'"
end

def to_subject string
  return "Obrigada por participar. Agora, vamos espalhar essa ideia!" if string == "thanks for poke"
  return "Exijo que o Metrô combata ativamente o abuso sexual em vagões e estações!" if string == "fight against the abuse on the trains"
  raise "I don't know '#{string}'"
end


def to_button string
  return "poke-submit-button" if string == "the poke form submit button"
  raise "I don't know '#{string}'"
end
