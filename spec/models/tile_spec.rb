require 'spec_helper'

describe Tile do
  before { @tile = Tile.new }

  subject { @tile }

  it { should respond_to(:board) }
  it { should_not respond_to(:board_id) }
  it { should respond_to(:advertisement) }
  it { should_not respond_to(:advertisement_id) }
  it { should respond_to(:x_location) }
  it { should respond_to(:y_location) }
  it { should respond_to(:cost) }
end
