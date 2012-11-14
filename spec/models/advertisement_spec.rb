require 'spec_helper'

describe Advertisement do
  let(:user) { FactoryGirl.create(:user) }
  let(:board) { FactoryGirl.create(:board) }
  let(:ad) { FactoryGirl.create(:advertisement, user: user, board: board) }

  subject { ad }

  it { should respond_to(:x_location) }
  it { should respond_to(:y_location) }
  it { should respond_to(:height) }
  it { should respond_to(:width) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:board) }
  it { should respond_to(:board_id) }
  it { should respond_to(:image) }

  describe 'accessible attributes' do
    it 'should not allow access to user_id' do
      expect do
	Advertisement.new(user_id: user)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it 'should not allow access to board_id' do
      expect do
	Advertisement.new(board_id: board)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
