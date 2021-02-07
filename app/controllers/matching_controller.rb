class MatchingController < ApplicationController
    before_action :authenticate_user!

    def index
        #自分にいいねした人のレコードを探して配列で返す
        got_reaction_user_ids = Reaction.where(to_user_id: current_user.id, status:'like').pluck(:from_user_id)
        #自分にいいねした人、自分がいいねした=マッチングした人を配列で返してる
        @match_users = Reaction.where(to_user_id: got_reaction_user_ids, from_user_id: current_user.id, status: 'like').map(&:to_user)
        @user = User.find(current_user.id) #ナビバーで使用
    end

    
end