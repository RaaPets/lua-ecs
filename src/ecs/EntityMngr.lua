local EntityManager = {}
EntityManager.__index = EntityManager

function EntityManager.new()
    local self = setmetatable({}, EntityManager)
    self.entities = {}
    self.nextEntityId = 1
    return self
end

function EntityManager:createEntity()
    local entity = {
        id = self.nextEntityId,
        components = {}
    }
    self.entities[entity.id] = entity
    self.nextEntityId = self.nextEntityId + 1
    return entity
end

function EntityManager:addComponent(entity, componentType, componentData)
    entity.components[componentType] = componentData
end

function EntityManager:getComponent(entity, componentType)
    return entity.components[componentType]
end

function EntityManager:removeComponent(entity, componentType)
    entity.components[componentType] = nil
end

function EntityManager:getAllEntities()
    return self.entities
end

return EntityManager
