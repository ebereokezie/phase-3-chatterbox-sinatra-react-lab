class Message < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/messages' do
        messages = Message.all
        messages.to_json
    end

    post '/messages' do
        message = Message.create(
            body: params[:body],
            username: params[:username]
        )

        message.to_json
    end

    patch '/messages/:id' do
        message_body = Message.find(params[:id])
        message_body.update(
            body: params[:body]
        )

        message_body.to_json
    end

    delete '/messages/:id' do
        message = Message.find(params[:id])
        message.destroy
        message.to_json
    end


end