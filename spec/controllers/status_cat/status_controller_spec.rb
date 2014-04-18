require 'spec_helper'

describe StatusCat::StatusController, :type => :controller do

  describe '#index' do

    it 'gets successfully' do
      get :index, :use_route => :status_cat
      response.should be_success
    end

    it 'assigns @checkers to StatusCat::Status.all' do
      get :index, :use_route => :status_cat

      @checkers = assigns[ :checkers ]
      @checkers.should_not be( nil )
      @checkers.length.should eql( StatusCat::Status.all.length )
      @checkers.each { |checker| checker.should be_a_kind_of( StatusCat::Checkers::Base ) }
    end

    it 'uses the configured before authentication filter' do
      expect( @controller ).to receive( :instance_eval ).with( &StatusCat.config.authenticate_with )
      expect( @controller ).to receive( :instance_eval ).with( &StatusCat.config.authorize_with )
      get :index
    end

  end

end
