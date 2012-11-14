require 'spec_helper'

describe Tile do
  before { @tile = Tile.new }

  subject { @tile }

  it { should respond_to(:board) }
  it { should respond_to(:advertisement) }
  it { should respond_to(:x_location) }
  it { should respond_to(:y_location) }
  it { should respond_to(:cost) }
end
