class MainsController < ApplicationController
def index
	render action: 'mypage-index'
end

def account
  render :layout => nil
end


end
