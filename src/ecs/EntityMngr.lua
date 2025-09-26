local EntityManager = {}
EntityManager.__index = EntityManager

function EntityManager.new()
    local self = setmetatable({}, EntityManager)
    self.entities = {}
    self.activeEntities = {}
    self.nextEntityId = 1
    self.recycledIds = {}
    return self
end

function EntityManager:createEntity()
    local entityId
    
    -- Reuse recycled IDs if available
    if #self.recycledIds > 0 then
        entityId = table.remove(self.recycledIds)
    else
        entityId = self.nextEntityId
        self.nextEntityId = self.nextEntityId + 1
    end
    
    local entity = {
        id = entityId,
        components = {},
        active = true
    }
    
    self.entities[entityId] = entity
    self.activeEntities[entityId] = entity
    
    return entity, entityId
end

function EntityManager:destroyEntity(id)
    local entity = self.entities[id]
    if entity then
        entity.active = false
        self.activeEntities[id] = nil
        
        -- Optional: Add ID to recycled pool
        table.insert(self.recycledIds, id)
    end
end

-- Iterate only over active entities
function EntityManager:getActiveEntities()
    return self.activeEntities
end
