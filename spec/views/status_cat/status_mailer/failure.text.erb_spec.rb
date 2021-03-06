require 'spec_helper'

describe 'status_cat/status_mailer/failure.text.erb' do

  before( :each ) do
    @checkers = StatusCat::Status.all
    assign( :checkers, @checkers )
  end

  it 'uses the status_table helper'  do
    view.should_receive( :status_report ).with( @checkers )
    render
  end

end
