require 'spec_helper'

describe Advertisement do
  before { @ad = Advertisement.new }

  subject { @ad }

  it { should respond_to(:cost) }
  it { should respond_to(:x_location) }
  it { should respond_to(:y_location) }
  it { should respond_to(:height) }
  it { should respond_to(:width) }
  it { should respond_to(:user) }
  it { should_not respond_to(:user_id) }
  it { should respond_to(:board) }
  it { should_not respond_to(:board_id) }
  it { should respond_to(:image) }
end
