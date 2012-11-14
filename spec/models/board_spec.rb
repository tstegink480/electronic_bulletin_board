require 'spec_helper'

describe Board do
  before { @board = Board.new }

  subject { @board }

  it { should respond_to(:name) }
  it { should respond_to(:user) }
  it { should_not respond_to(:user_id) }
  it { should respond_to(:height) }
  it { should respond_to(:width) }
end
