local World = {
	entities = {},
	nextEntityNum = 1,
}

function World:createEntity()
	local entity = {
		num = self.nextEntityNum,
		id = 'IDx'..tostring(self.nextEntityNum),
		components = {},
	}
	self.entities[entity.id] = entity
	self.nextEntityNum = 1 + self.nextEntityNum
	return entity.id
end

function World:removeEntityById(id)
	self.entities[id] = nil
end

function World:addComponent(id, ComponentType, component)
	self.entities[id].components[ComponentType] = component
end


--[[ dbg ]]
function World:debug()
	print('>>', 'next', self.nextEntityId)
	for key, value in pairs(self.entities) do
		local tag = value.components['tag']
		local pos = value.components['pos'] or {x=nil, y=nil}
		print('>', key, value.id, tag, pos.x, pos.y)
	end
	print('> ------------------------')
end

return World
