class WhiteboardsChannel < ApplicationCable::Channel
  def subscribed
    scene = Scene.find(params[:scene_id])
    stream_for scene 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
