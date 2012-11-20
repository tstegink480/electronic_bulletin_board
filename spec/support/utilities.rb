include ApplicationHelper

def match_alert(subject, level, message)
  subject.should have_selector("div.alert.alert-#{level}", text: message)
end

RSpec::Matchers.define :have_success do |expected|
  match do |actual|
    match_alert(actual, 'success', expected)
  end
end

RSpec::Matchers.define :have_notice do |expected|
  match do |actual|
    match_alert(actual, 'notice', expected)
  end
end

RSpec::Matchers.define :have_error do |expected|
  match do |actual|
    match_alert(actual, 'error', expected)
  end
end
