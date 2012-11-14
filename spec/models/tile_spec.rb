require 'spec_helper'

describe Tile do
  let(:user) { FactoryGirl.create(:user) }
  let(:board) { FactoryGirl.create(:board, user: user) }
  let(:ad) { FactoryGirl.create(:advertisement, user: user, board: board) }
  let(:tile) { FactoryGirl.create(:tile, board: board, advertisement: ad) }

  subject { tile }

  it { should respond_to(:board) }
  it { should respond_to(:board_id) }
  it { should respond_to(:advertisement) }
  it { should respond_to(:advertisement_id) }
  it { should respond_to(:x_location) }
  it { should respond_to(:y_location) }
  it { should respond_to(:cost) }

  describe 'accessible attributes' do
    it 'should not allow access to board_id' do
      expect do
	Tile.new(board_id: board)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it 'should not allow access to advertisement_id' do
      expect do
	Tile.new(advertisement_id: ad)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
