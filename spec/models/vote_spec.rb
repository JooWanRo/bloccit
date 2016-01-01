require 'rails_helper'

describe Vote do
  include TestFactories

  describe "validations" do
    before do
      @good_vote_1 = Vote.new(value: 1)
      @good_vote_2 = Vote.new(value: -1)
      @bad_vote_1 = Vote.new(value: 0)
      @bad_vote_2 = Vote.new(value: 10)
      @bad_vote_3 = Vote.new(value: -10)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @good_vote_1.valid? ).to eq(true)
        expect( @good_vote_2.valid? ).to eq(true)
        expect( @bad_vote_1.valid? ).to eq(false)
        expect( @bad_vote_2.valid? ).to eq(false)
        expect( @bad_vote_3.valid? ).to eq(false)
      end
    end
  end

  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end

