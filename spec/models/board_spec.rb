require 'spec_helper'

describe Board do
  let(:user) { FactoryGirl.create(:user) }
  let(:board) { FactoryGirl.create(:board, user: user) }

  subject { board }

  it { should respond_to(:name) }
  it { should respond_to(:user) }
  it { should respond_to(:user_id) }
  it { should respond_to(:height) }
  it { should respond_to(:width) }

  describe 'accessible attributes' do
    it 'should not allow access to user_id' do
      expect do
	Board.new(user_id: user)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
