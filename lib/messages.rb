module Messages

    def get_messages(num=1)  
        messages = self.class.get(@base_url+"/message_threads", headers: @header, body: { page: num } )
        JSON.parse(messages.body)
    end    

    def create_message(recipient_id, subject, text)
        message = self.class.post(@base_url+"/messages",
        header: @header,
        body: {
            sender: @email,
            recipient_id: recipient_id,
            subject: subject,
            'stripped-text': text
            }
        )
    end

end