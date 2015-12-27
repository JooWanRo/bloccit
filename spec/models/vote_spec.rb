require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      @good_vote_1 = Vote.create(value: 1)
      @good_vote_2 = Vote.create(value: -1)
      @bad_vote_1 = Vote.create(value: 0)
      @bad_vote_2 = Vote.create(value: 10)
      @bad_vote_3 = Vote.create(value: -10)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @good_vote_1.save ).to eq(true)
        expect( @good_vote_2.save ).to eq(true)
        expect( @bad_vote_1.save ).to eq(false)
        expect( @bad_vote_2.save ).to eq(false)
        expect( @bad_vote_3.save ).to eq(false)
      end
    end
  end
end
