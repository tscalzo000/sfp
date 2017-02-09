class ConversationsController < ApplicationController
  before_action do
    authenticate_user!
  end

  def index
    @list = []
    @users = User.all
    @users.each do |user|
      unless user == current_user
        @list << [user.username, user.id]
      end
    end
    @conversations = Conversation.where(sender_id: current_user.id)
    @conversations += Conversation.where(recipient_id: current_user.id)
    @conversation = Conversation.new
    @conversations.each do |convo|
      if convo.messages == []
        convo.delete
      end
    end
    @conversations = Conversation.where(sender_id: current_user.id)
    @conversations += Conversation.where(recipient_id: current_user.id)
  end

  def create
    if Conversation.between(params[:conversation][:sender_id],params[:conversation][:recipient_id]).present?
      @conversation = Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).first
    else
      @conversation = Conversation.create(sender_id: (params[:conversation][:sender_id]), recipient_id: (params[:conversation][:recipient_id]))
    end
    redirect_to conversation_messages_path(@conversation)
  end
end
