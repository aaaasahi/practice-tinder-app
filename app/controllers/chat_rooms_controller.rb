class ChatRoomsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        #自分がいるチャットルームの取得
        current_user_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
        #自分がいるチャットルームでかつ、マッチング一覧ページからクリックしたユーザーがいるチャットルーム
        chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first
        #チャットルームがなければ作成
        if chat_room.blank?
            chat_room = ChatRoom.create
            ChatRoomUser.create(chat_room: chat_room, user_id: current_user.id)
            ChatRoomUser.create(chat_room: chat_room, user_id: params[:user_id])
        end
        #showページにリダイレクト
        redirect_to action: :show, id: chat_room.id
    end

    def show
    end
end