module RoadMap

    def get_roadmap(roadmap_id)
        roadmap = self.class.get(@base_url+"/roadmaps/#{roadmap_id}", headers: @header)
        JSON.parse(roadmap.body)
    end

    def get_checkpoint(checkpoint_id)
        checkpoint = self.class.get(@base_url+"/checkpoints/#{checkpoint_id}", headers: @header)
        JSON.parse(checkpoint.body)
    end
    
end