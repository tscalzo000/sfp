class MessagesController < ApplicationController
  before_action do
    authenticate_user!
    @conversation = Conversation.find(params[:conversation_id])
    if (current_user.id != @conversation.sender_id) && (current_user.id != @conversation.recipient_id)
      flash[:alert] = 'You do not have access to that resource'
      redirect_back(fallback_location: user_path(current_user))
    end
  end

  def index
    @messages = @conversation.messages
    @messages.each do |message|
      if message.user_id != current_user.id
        message.read = true
        message.save
      end
    end
    @message = @conversation.messages.new
    if (current_user.id == @conversation.recipient_id)
      @user = User.find(@conversation.sender_id)
    else
      @user = User.find(@conversation.recipient_id)
    end
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      flash[:alert] = @message.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(
      :body,
      :user_id
    )
  end
end
